;;; standardfmt.el --- Format JavaScript with standard / semistandard.

;; Copyright (C) 2017 Jim Myhrberg

;; Author: Jim Myhrberg
;; Keywords: convenience tools extensions js javascript standard semistandard
;; URL: https://github.com/jimeh/standardfmt.el
;; Version: 0.1.0

;; This file is not part of GNU Emacs.

;;; License:
;;
;; Permission is hereby granted, free of charge, to any person obtaining a
;; copy of this software and associated documentation files (the "Software"),
;; to deal in the Software without restriction, including without limitation
;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;; and/or sell copies of the Software, and to permit persons to whom the
;; Software is furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;; DEALINGS IN THE SOFTWARE.

;;; Commentary:
;;
;; The core parts of standardfmt.el are borrowed from the gofmt related
;; parts of go-mode.el 1.4.0. So most credit goes to The Go Authors.

;;; Code:

(defgroup standardfmt nil
  "Minor mode for formatting JavaScript buffers with standard/semistandard."
  :link '(url-link "https://github.com/jimeh/standardfmt.el")
  :group 'js)

(defcustom standardfmt-command "standard"
  "Specify which formatter to use."
  :type '(choice
          (string :tag "standard" "standard")
          (string :tag "semistandard" "semistandard"))
  :group 'standardfmt)

(defcustom standardfmt-command-args nil
  "Arguments passed to 'semistandard'."
  :type '(repeat string)
  :group 'standardfmt)

(defcustom standardfmt-custom-command nil
  "Specifty a custom formatter command."
  :type 'string
  :group 'standardfmt)

(defun standardfmt ()
  "Format the current buffer with standard/semistandard."
  (interactive)
  (let ((tmpfile (make-temp-file "standardfmt" nil ".js"))
        (patchbuf (get-buffer-create "*standardfmt patch*"))
        (coding-system-for-read 'utf-8)
        (coding-system-for-write 'utf-8)
        our-command-args)

    (unwind-protect
        (save-restriction
          (widen)
          (with-current-buffer patchbuf (erase-buffer))

          (write-region nil nil tmpfile)

          (setq our-command-args (append our-command-args
                                         standardfmt-command-args
                                         (list "--fix" tmpfile)))

          (message "Calling standard: %s %s"
                   standardfmt-command our-command-args)

          (apply #'call-process-region (point-min) (point-max)
                 standardfmt-command nil nil nil our-command-args)

          (if (zerop (call-process-region (point-min) (point-max)
                                          "diff" nil patchbuf nil "-n" "-"
                                          tmpfile))
              (message "Buffer is already semistandard")
            (standardfmt--apply-rcs-patch patchbuf)
            (message "Applied semistandard"))))

    (kill-buffer patchbuf)
    (delete-file tmpfile)))

(defun standardfmt--apply-rcs-patch (patch-buffer)
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
            (error "invalid rcs patch or internal error in standardfmt--apply-rcs-patch"))
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
                (standardfmt--goto-line (- from line-offset))
                (cl-incf line-offset len)
                (standardfmt--delete-whole-line len)))
             (t
              (error "invalid rcs patch or internal error in standardfmt--apply-rcs-patch")))))))))

(defun standardfmt--delete-whole-line (&optional arg)
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

(defun standardfmt--goto-line (line)
  (goto-char (point-min))
  (forward-line (1- line)))

;;;###autoload
(define-minor-mode standardfmt-mode
  "Enable format-on-save for javascript mode buffers via standardfmt."
  :lighter " fmt"
  (if standardfmt-mode
      (add-hook 'before-save-hook 'standardfmt-before-save t t)
    (remove-hook 'before-save-hook 'standardfmt-before-save t)))

(defun standardfmt-before-save ()
  "Format buffer via standardfmt if major mode is a javascript mode."
  (interactive)
  (standardfmt))

(provide 'standardfmt)
;;; standardfmt.el ends here
