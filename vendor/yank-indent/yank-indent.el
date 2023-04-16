;;; yank-indent.el --- Automatically indent yanked text -*- lexical-binding: t -*-

;; Version: 0.1.0
;; Author: Jim Myhrberg <contact@jimeh.me>
;; Keywords: editor, yank, indent
;; Package-Requires: ((emacs "25.1"))

;; This file is not part of GNU Emacs.

;;; License:
;;
;; Copyright (c) 2023 Jim Myhrberg.
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
;; Automatically yank indented regions when yank-indent-mode is enabled.

;;; Code:

(defgroup yank-indent nil
  "Customization options for the yank-indent package.

The yank-indent package provides functionality to automatically
indent yanked text according to the current mode's indentation
rules. This group contains customization options for controlling
the behavior of `yank-indent-mode' and `global-yank-indent-mode'."
  :group 'editing)

(defcustom yank-indent-threshold 5000
  "Max chars in yanked region to trigger auto indentation.

If the yanked region contains more characters than the value
specified by `yank-indent-threshold', the automatic indentation
will not occur. This helps prevent performance issues when
working with large blocks of text."
  :type 'number
  :group 'yank-indent)

(defcustom yank-indent-derived-modes '(prog-mode tex-mode)
  "Major modes from which derived modes should enable `yank-indent-mode'.

When `global-yank-indent-mode' is enabled, it activates
`yank-indent-mode' in buffers with major modes derived from those
listed in this variable. This is useful when you want to enable
`yank-indent-mode' for all modes that inherit from a specific
mode, such as `prog-mode' for programming modes or `text-mode'
for text editing modes."
  :type '(repeat symbol)
  :group 'yank-indent)

(defcustom yank-indent-exact-modes '()
  "Major modes where `yank-indent-mode' should be enabled.

When `global-yank-indent-mode' is enabled, it activates
`yank-indent-mode' in buffers with major modes listed in this
variable. Unlike `yank-indent-derived-modes', `yank-indent-mode'
will not be activated in modes derived from those listed here.
Use this variable to list specific modes where you want
`yank-indent-mode' to be enabled without affecting their derived
modes."
  :type '(repeat symbol)
  :group 'yank-indent)

(defcustom yank-indent-excluded-modes '(cmake-ts-mode
                                        coffee-mode
                                        conf-mode
                                        haml-mode
                                        makefile-automake-mode
                                        makefile-bsdmake-mode
                                        makefile-gmake-mode
                                        makefile-imake-mode
                                        makefile-makepp-mode
                                        makefile-mode
                                        python-mode
                                        python-ts-mode
                                        slim-mode
                                        yaml-mode
                                        yaml-ts-mode)
  "Major modes where `yank-indent-mode' should not be enabled.

`global-yank-indent-mode' will not activate `yank-indent-mode' in
buffers with major modes listed in this variable or their derived
modes. This list takes precedence over
`yank-indent-derived-modes' and `yank-indent-exact-modes'. Use
this variable to exclude specific modes and their derived modes
from having `yank-indent-mode' enabled."
  :type '(repeat symbol)
  :group 'yank-indent)

(defun yank-indent--should-indent-p ()
  "Return non-nil if current mode should be indented."
  (and (not (minibufferp))
       (not (member major-mode yank-indent-excluded-modes))
       (or (member major-mode yank-indent-exact-modes)
           (apply #'derived-mode-p yank-indent-derived-modes))))

(defun yank-indent--maybe-indent-advice (&optional _)
  "Conditionally indent the current region after yanking.

Indentation is applied only if the region size is less than or
equal to `yank-indent-threshold' and no prefix argument is
provided. This function is used as advice for `yank' and
`yank-pop' functions."
  (if (and (not current-prefix-arg))
      (let ((beg (region-beginning))
            (end (region-end))
            (mark-even-if-inactive transient-mark-mode))
        (if (<= (- end beg) yank-indent-threshold)
            (indent-region beg end)))))

;;;###autoload
(define-minor-mode yank-indent-mode
  "Minor mode for automatically indenting yanked text.

When enabled, this mode indents the yanked region according to
the current mode's indentation rules, provided that the region
size is less than or equal to `yank-indent-threshold' and no
prefix argument is given during yanking."
  :lighter " YI"
  :group 'yank-indent
  (if yank-indent-mode
    (progn
      (advice-add #'yank :after #'yank-indent--maybe-indent-advice)
      (advice-add #'yank-pop :after #'yank-indent--maybe-indent-advice))
    (progn
        (advice-remove #'yank #'yank-indent--maybe-indent-advice)
        (advice-remove #'yank-pop #'yank-indent--maybe-indent-advice))))

(defun yank-indent--enable ()
  "Enable `yank-indent-mode' if the current buffer meets the criteria.

This function checks if the current buffer's major mode should
have `yank-indent-mode' enabled based on the settings in
`yank-indent-derived-modes', `yank-indent-exact-modes', and
`yank-indent-excluded-modes'. If the criteria are met, it enables
`yank-indent-mode'."
  (when (yank-indent--should-indent-p)
    (yank-indent-mode 1)))

;;;###autoload
(define-globalized-minor-mode global-yank-indent-mode
  yank-indent-mode
  yank-indent--enable
  :group 'yank-indent)

(provide 'yank-indent)
;;; yank-indent.el ends here
