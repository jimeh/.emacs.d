;;; rubocopfmt.el --- Minor-mode to format Ruby code with RuboCop on save

;; Version: 0.2.2
;; Keywords: convenience wp edit ruby rubocop
;; Package-Requires: ((cl-lib "0.5"))
;; URL: https://github.com/jimeh/rubocopfmt.el
;; Author: Jim Myhrberg

;; This file is not part of GNU Emacs.

;;; License:
;;
;; Copyright (c) 2014 The go-mode Authors. All rights reserved.
;; Portions Copyright (c) 2018 Jim Myhrberg.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions are
;; met:
;;
;;    * Redistributions of source code must retain the above copyright
;; notice, this list of conditions and the following disclaimer.
;;    * Redistributions in binary form must reproduce the above
;; copyright notice, this list of conditions and the following disclaimer
;; in the documentation and/or other materials provided with the
;; distribution.
;;    * Neither the name of the copyright holder nor the names of its
;; contributors may be used to endorse or promote products derived from
;; this software without specific prior written permission.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;; A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;; OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
;; LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;; THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

;;; Commentary:
;;
;; This library formats Ruby code by using rubocop and it's --auto-correct
;; option.

;;; Code:

(require 'cl-lib)

(defgroup rubocopfmt nil
  "Minor mode for formatting Ruby buffers with rubocop."
  :group 'languages
  :link '(url-link "https://github.com/jimeh/rubocopfmt.el"))

(defcustom rubocopfmt-rubocop-command "rubocop"
  "Name of rubocop executable."
  :type 'string
  :group 'rubocopfmt)

(defcustom rubocopfmt-disabled-cops
  '("Lint/Debugger"              ; Don't remove debugger calls.
    "Lint/UnusedBlockArgument"   ; Don't rename unused block arguments.
    "Lint/UnusedMethodArgument"  ; Don't rename unused method arguments.
    "Style/EmptyMethod"          ; Don't remove blank line in empty methods.
    )
  "A list of RuboCop cops to disable during auto-correction.
These cops are disabled because they cause confusion during
interactive use within a text-editor."
  :type '(repeat string)
  :group 'rubocopfmt)

(defcustom rubocopfmt-show-errors 'buffer
  "Where to display rubocopfmt error output.
It can either be displayed in its own buffer, in the echo area,
or not at all.

Please note that Emacs outputs to the echo area when writing
files and will overwrite rubocopfmt's echo output if used from
inside a `before-save-hook'."
  :type '(choice
          (const :tag "Own buffer" buffer)
          (const :tag "Echo area" echo)
          (const :tag "None" nil))
  :group 'rubocopfmt)


(defun rubocopfmt--apply-rcs-patch (patch-buffer)
  "Apply an RCS-formatted diff from PATCH-BUFFER to the current buffer."
  (let ((target-buffer (current-buffer))
        ;; Relative offset between buffer line numbers and line numbers
        ;; in patch.
        ;;
        ;; Line numbers in the patch are based on the source file, so
        ;; we have to keep an offset when making changes to the
        ;; buffer.
        ;;
        ;; Appending lines decrements the offset (possibly making it
        ;; negative), deleting lines increments it. This order
        ;; simplifies the forward-line invocations.
        (line-offset 0))
    (save-excursion
      (with-current-buffer patch-buffer
        (goto-char (point-min))
        (while (not (eobp))
          (unless (looking-at "^\\([ad]\\)\\([0-9]+\\) \\([0-9]+\\)")
            (error "Invalid rcs patch or internal error in rubocopfmt--apply-rcs-patch"))
          (forward-line)
          (let ((action (match-string 1))
                (from (string-to-number (match-string 2)))
                (len  (string-to-number (match-string 3))))
            (cond
             ((equal action "a")
              (let ((start (point)))
                (forward-line len)
                (let ((text (buffer-substring start (point))))
                  (with-current-buffer target-buffer
                    (cl-decf line-offset len)
                    (goto-char (point-min))
                    (forward-line (- from len line-offset))
                    (insert text)))))
             ((equal action "d")
              (with-current-buffer target-buffer
                (rubocopfmt--goto-line (- from line-offset))
                (cl-incf line-offset len)
                (rubocopfmt--delete-whole-line len)))
             (t
              (error "Invalid rcs patch or internal error in rubocopfmt--apply-rcs-patch")))))))))

(defun rubocopfmt--delete-whole-line (&optional arg)
  "Delete the current line without putting it in the `kill-ring'.
Derived from function `kill-whole-line'.  ARG is defined as for that
function."
  (setq arg (or arg 1))
  (if (and (> arg 0)
           (eobp)
           (save-excursion (forward-visible-line 0) (eobp)))
      (signal 'end-of-buffer nil))
  (if (and (< arg 0)
           (bobp)
           (save-excursion (end-of-visible-line) (bobp)))
      (signal 'beginning-of-buffer nil))
  (cond ((zerop arg)
         (delete-region (progn (forward-visible-line 0) (point))
                        (progn (end-of-visible-line) (point))))
        ((< arg 0)
         (delete-region (progn (end-of-visible-line) (point))
                        (progn (forward-visible-line (1+ arg))
                               (unless (bobp)
                                 (backward-char))
                               (point))))
        (t
         (delete-region (progn (forward-visible-line 0) (point))
                        (progn (forward-visible-line arg) (point))))))

(defun rubocopfmt--goto-line (line)
  "Move cursor to LINE."
  (goto-char (point-min))
  (forward-line (1- line)))

(defun rubocopfmt--bundled-path-p (directory)
  "Check if there is a Gemfile in DIRECTORY, or any parent of DIRECTORY."
  (rubocopfmt--file-search-upward directory "Gemfile"))

(defun rubocopfmt--file-search-upward (directory file)
  "Search DIRECTORY for FILE and return its full path if found, or NIL if not.

If FILE is not found in DIRECTORY, the parent of DIRECTORY will be searched."
  (let ((parent-dir (file-truename (concat (file-name-directory directory) "../")))
        (current-path (if (not (string= (substring directory (- (length directory) 1)) "/"))
                          (concat directory "/" file)
                        (concat directory file))))

    (if (file-exists-p current-path)
        current-path
      (when (and (not (string= (file-truename directory) parent-dir))
                 (< (length parent-dir) (length (file-truename directory))))
        (rubocopfmt--file-search-upward parent-dir file)))))

(defun rubocopfmt--parse-result (resultbuf tmpfile)
  "Parse Rubocop result in RESULTBUF and write corrections to TMPFILE."
  (let ((split 0))
    (with-current-buffer resultbuf
      (goto-char (point-min))
      ;; Only find the separator when RuboCop has printed complaints.
      (setq split (search-forward "\n====================\n" nil t))

      ;; If no RuboCop complaints were printed, we need to find the separator at
      ;; the beginning of the buffer. This separation helps prevent false
      ;; positive separator matches.
      (unless split
        (setq split (search-forward "====================\n" nil t)))

      (if split
          (when (> split 22)
            (goto-char (point-min))
            (when (search-forward "[Corrected]" split t)
              (write-region split (point-max) tmpfile)
              t))
        (rubocopfmt--process-errors resultbuf)
        nil))))

(defun rubocopfmt--process-errors (resultbuf)
  "Display contents of RESULTBUF as errors."
  (if (eq rubocopfmt-show-errors 'echo)
      (with-current-buffer resultbuf
        (message (buffer-string))))

  (if (eq rubocopfmt-show-errors 'buffer)
      (let ((errbuf (get-buffer-create "*Rubocopfmt Errors*")))
        (with-current-buffer errbuf
          (erase-buffer)
          (goto-char (point-min))
          (insert-buffer-substring resultbuf))
          (display-buffer errbuf))))


;;;###autoload
(defun rubocopfmt ()
  "Format the current buffer with rubocop."
  (interactive)
  (let* ((coding-system-for-read 'utf-8)
         (coding-system-for-write 'utf-8)
         (tmpfile (make-temp-file "rubocopfmt" nil ".rb"))
         (resultbuf (get-buffer-create "*Rubocopfmt Result*"))
         (patchbuf (get-buffer-create "*Rubocopfmt Patch*"))
         (buffer-file (file-truename buffer-file-name))
         (src-dir (file-name-directory buffer-file))
         (src-file (file-name-nondirectory buffer-file))
         (fmt-command rubocopfmt-rubocop-command)
         (fmt-args (list "--stdin" src-file
                         "--auto-correct"
                         "--format" "emacs")))

    (if (rubocopfmt--bundled-path-p src-dir)
        (setq fmt-command "bundle"
              fmt-args (append (list "exec" rubocopfmt-rubocop-command)
                               fmt-args)))

    (if rubocopfmt-disabled-cops
        (setq fmt-args (append fmt-args (list "--except"
                                              (combine-and-quote-strings
                                               rubocopfmt-disabled-cops ",")))))

    (unwind-protect
        (save-restriction
          (widen)
          (write-region nil nil tmpfile)
          (with-current-buffer resultbuf (erase-buffer))
          (with-current-buffer patchbuf (erase-buffer))

          (let ((current-directory src-dir))
            (message "Calling rubocop from directory \"%s\": %s %s"
                     src-dir fmt-command (mapconcat 'identity fmt-args " "))
            (apply #'call-process-region (point-min) (point-max)
                   fmt-command nil resultbuf nil fmt-args)
            (if (rubocopfmt--parse-result resultbuf tmpfile)
                (call-process-region (point-min) (point-max) "diff"
                                     nil patchbuf nil "-n" "-" tmpfile)))

          (if (= (buffer-size patchbuf) 0)
              (message "Buffer is already rubocopfmted")
            (rubocopfmt--apply-rcs-patch patchbuf)
            (message "Applied rubocopfmt")))

      (delete-file tmpfile)
      (kill-buffer resultbuf)
      (kill-buffer patchbuf))))

;;;###autoload
(define-minor-mode rubocopfmt-mode
  "Enable format-on-save for `ruby-mode' buffers via rubocopfmt."
  :lighter " fmt"
  (if rubocopfmt-mode
      (add-hook 'before-save-hook 'rubocopfmt-before-save t t)
    (remove-hook 'before-save-hook 'rubocopfmt-before-save t)))

(defun rubocopfmt-before-save ()
  "Format buffer via rubocopfmt if major mode is `ruby-mode'."
  (interactive)
  (when (eq major-mode 'ruby-mode) (rubocopfmt)))

(provide 'rubocopfmt)
;;; rubocopfmt.el ends here
