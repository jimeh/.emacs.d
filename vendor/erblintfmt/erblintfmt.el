;;; erblintfmt.el --- Minor-mode to format Ruby code with Erblint on save -*- lexical-binding: t -*-

;; Author: Jim Myhrberg <contact@jimeh.me>
;; URL: https://github.com/jimeh/.emacs.d/tree/master/vendor/erblintfmt
;; Keywords: convenience edit ruby erb erblint
;; Package-Requires: ((cl-lib "0.5"))
;; Version: 0.0.1

;; This file is not part of GNU Emacs.

;;; License:
;;
;; Copyright (c) 2014 The go-mode Authors. All rights reserved.
;; Portions Copyright (c) 2024 Jim Myhrberg.
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
;; This library formats Ruby code by using erblint and it's --autocorrect
;; option.

;;; Code:

(require 'cl-lib)

(defgroup erblintfmt nil
  "Minor mode for formatting Ruby buffers with erblint."
  :group 'languages
  :link '(url-link "https://github.com/jimeh/erblintfmt.el"))

(defcustom erblintfmt-erblint-command "erb_lint"
  "Name of erblint executable."
  :type 'string
  :group 'erblintfmt)

(defcustom erblintfmt-use-bundler-when-possible t
  "When t and Gemfile is present, run erblint with `bundle exec'."
  :type 'boolean
  :group 'erblintfmt)

(defcustom erblintfmt-show-errors 'buffer
  "Where to display erblintfmt error output.
It can either be displayed in its own buffer, in the echo area,
or not at all.

Please note that Emacs outputs to the echo area when writing
files and will overwrite erblintfmt's echo output if used from
inside a `before-save-hook'."
  :type '(choice
          (const :tag "Own buffer" buffer)
          (const :tag "Echo area" echo)
          (const :tag "None" nil))
  :group 'erblintfmt)

(defcustom erblintfmt-major-modes '(web-mode)
  "List of major modes to format on save when erblintfmt-mode is enabled."
  :type '(repeat symbol)
  :group 'erblintfmt)

;; (defcustom erblintfmt-on-save-use-lsp-format-buffer nil
;;   "EXPERIMENTAL: When set to t and lsp-mode is enabled, use `lsp-format-buffer'
;; to format buffer before saving, instead of `erblintfmt'."
;;   :type 'boolean
;;   :group 'erblintfmt)

(defun erblintfmt-is-erb-file ()
  "Check if the current buffer is an ERB file."
  (and buffer-file-name
       (string= (file-name-extension buffer-file-name) "erb")))

(defun erblintfmt--apply-rcs-patch (patch-buffer)
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
        (line-offset 0)
        (column (current-column)))
    (save-excursion
      (with-current-buffer patch-buffer
        (goto-char (point-min))
        (while (not (eobp))
          (unless (looking-at "^\\([ad]\\)\\([0-9]+\\) \\([0-9]+\\)")
            (error "Invalid rcs patch or internal error in erblintfmt--apply-rcs-patch"))
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
                (erblintfmt--goto-line (- from line-offset))
                (cl-incf line-offset len)
                (erblintfmt--delete-whole-line len)))
             (t
              (error "Invalid rcs patch or internal error in erblintfmt--apply-rcs-patch")))))))
    (move-to-column column)))

(defun erblintfmt--delete-whole-line (&optional arg)
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

(defun erblintfmt--goto-line (line)
  "Move cursor to LINE."
  (goto-char (point-min))
  (forward-line (1- line)))

(defun erblintfmt--bundled-path-p (directory)
  "Check if there is a Gemfile in DIRECTORY, or any parent of DIRECTORY."
  (erblintfmt--file-search-upward directory "Gemfile"))

(defun erblintfmt--file-search-upward (directory file)
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
        (erblintfmt--file-search-upward parent-dir file)))))

(defun erblintfmt--parse-result (resultbuf tmpfile)
  "Parse Erblint result in RESULTBUF and write corrections to TMPFILE."
  (let ((split 0)
        (sep (concat "\n[=]+ " (regexp-quote buffer-file-name) " [=]+\n")))
    (with-current-buffer resultbuf
      (goto-char (point-min))
      (setq split (search-forward-regexp sep nil t))

      (if split
          (when (> split 22)
            (goto-char (point-min))
            (when (search-forward "error(s) corrected in ERB files" (+ 1 split) t)
              (write-region split (point-max) tmpfile)
              t))
        (erblintfmt--process-errors resultbuf)
        nil))))

(defun erblintfmt--process-errors (resultbuf)
  "Display contents of RESULTBUF as errors."
  (if (eq erblintfmt-show-errors 'echo)
      (with-current-buffer resultbuf
        (message (buffer-string))))

  (if (eq erblintfmt-show-errors 'buffer)
      (let ((errbuf (get-buffer-create "*Erblintfmt Errors*")))
        (with-current-buffer errbuf
          (erase-buffer)
          (goto-char (point-min))
          (insert-buffer-substring resultbuf))
          (display-buffer errbuf))))


;;;###autoload
(defun erblintfmt ()
  "Format the current buffer with erblint."
  (interactive)
  (let* ((coding-system-for-read 'utf-8)
         (coding-system-for-write 'utf-8)
         (tmpfile (make-temp-file "erblintfmt" nil ".rb"))
         (resultbuf (get-buffer-create "*Erblintfmt Result*"))
         (patchbuf (get-buffer-create "*Erblintfmt Patch*"))
         (buffer-file (file-truename buffer-file-name))
         (src-dir (file-name-directory buffer-file))
         (src-file (file-name-nondirectory buffer-file))
         (fmt-command erblintfmt-erblint-command)
         (fmt-args (list "--stdin" src-file
                         "--autocorrect"
                         "--format" "compact")))

    (if (and erblintfmt-use-bundler-when-possible
             (erblintfmt--bundled-path-p src-dir))
        (setq fmt-command "bundle"
              fmt-args (append (list "exec" erblintfmt-erblint-command)
                               fmt-args)))

    (unwind-protect
        (save-restriction
          (widen)
          (write-region nil nil tmpfile)
          (with-current-buffer resultbuf (erase-buffer))
          (with-current-buffer patchbuf (erase-buffer))

          (let ((current-directory src-dir))
            (message "Calling erblint from directory \"%s\": %s %s"
                     src-dir fmt-command (mapconcat 'identity fmt-args " "))
            (apply #'call-process-region (point-min) (point-max)
                   fmt-command nil resultbuf nil fmt-args)
            (if (erblintfmt--parse-result resultbuf tmpfile)
                (call-process-region (point-min) (point-max) "diff"
                                     nil patchbuf nil "-n" "-" tmpfile)))

          (if (= (buffer-size patchbuf) 0)
              (message "Buffer is already erblintfmted")
            (erblintfmt--apply-rcs-patch patchbuf)
            (message "Applied erblintfmt")))

      (delete-file tmpfile)
      (kill-buffer resultbuf)
      (kill-buffer patchbuf))))

;;;###autoload
(define-minor-mode erblintfmt-mode
  "Enable format-on-save for `ruby-mode' buffers via erblintfmt."
  :lighter " fmt"
  (if erblintfmt-mode
      (add-hook 'before-save-hook 'erblintfmt-before-save t t)
    (remove-hook 'before-save-hook 'erblintfmt-before-save t)))

(defun erblintfmt-before-save ()
  "Format buffer if it is a ERB file.

Major mode most be listed in `erblintfmt-major-modes', and buffer file
name must have a `.erb' extension.

Formatting is done via `erblint'."
  (interactive)
  (when (and (member major-mode erblintfmt-major-modes)
             (erblintfmt-is-erb-file))
    (erblintfmt)))

(provide 'erblintfmt)
;;; erblintfmt.el ends here
