;;; flycheck-erblint.el --- Check files with erblint via flycheck -*- lexical-binding: t -*-

;; Author: Jim Myhrberg <contact@jimeh.me>
;; URL: https://github.com/jimeh/.emacs.d/tree/master/vendor/flycheck-erblint
;; Keywords: language, linting, tools
;; Package-Requires: ((flycheck "30"))
;; Version: 0.0.1

;; This file is not part of GNU Emacs.

;;; License:
;;
;; Copyright (c) 2024 Jim Myhrberg
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:
;;
;; This package provides a Flycheck checker for ERB files using erblint.

;;; Code:

(require 'flycheck)

(defgroup flycheck-erblint nil
  "Check files with erblint via flycheck."
  :group 'tools)

(defcustom flycheck-erblint-extra-args nil
  "Extra arguments to pass to erblint."
  :type '(repeat string)
  :group 'flycheck-erblint)

(defun flycheck-erblint--working-directory (&optional _checker)
  "Return the nearest directory holding the buf.yaml configuration."
  (when buffer-file-name
    (let ((config (file-name-directory (flycheck-erblint--config-file)))
          (gemfile (file-name-directory (locate-dominating-file buffer-file-name
                                                                "Gemfile"))))
      ;; Return base directory of the config file if it longer (more specific)
      ;; than that of the Gemfile..
      (if (and config gemfile)
          (if (> (length config) (length gemfile))
              config
            gemfile)
        (or config gemfile)))))

(defun flycheck-erblint--config-file ()
  "Return the nearest directory holding the buf.yaml configuration."
  (when buffer-file-name
    (let ((dir (locate-dominating-file buffer-file-name
                                       flycheck-erblint-config-filename)))
      (if dir
          (expand-file-name flycheck-erblint-config-filename dir)))))

(defun flycheck-erblint--is-erb-file ()
  "Check if the current buffer is an ERB file."
  (and buffer-file-name
       (string= (file-name-extension buffer-file-name) "erb")))

(defun flycheck-erblint--parse-json (output checker buffer)
  "Parse erblint errors from JSON OUTPUT.

CHECKER and BUFFER denote the CHECKER that returned OUTPUT and
the BUFFER that was checked respectively.

The JSON structure is expected to have a list of files, each with its own
list of offenses.

See URL `https://github.com/Shopify/erb-lint' for more information
about erb-lint."
  (let ((errors (car (flycheck-parse-json output))))
    (seq-mapcat (lambda (file)
                  (let-alist file
                    (seq-map (lambda (offense)
                               (let-alist offense
                                 (flycheck-error-new
                                  :line .location.start_line
                                  :column (+ 1 .location.start_column)
                                  :level 'error
                                  :message (replace-regexp-in-string "\n" " "
                                                                     .message)
                                  :checker checker
                                  :buffer buffer
                                  :filename .path
                                  :end-line .location.last_line
                                  :end-column .location.last_column)))
                             .offenses)))
                (alist-get 'files errors))))

(flycheck-def-config-file-var flycheck-erblint-config-filename erblint
                              ".erb-lint.yml")
(flycheck-def-executable-var erblint "erblint")
(flycheck-define-checker erblint
  "An Erb linter using erblint.

See URL `https://github.com/Shopify/erb-lint' for more information
about erb-lint."
  :command ("erb_lint" "--format" "json"
            (config-file "--config" flycheck-erblint-config-filename)
            "--stdin" source-original)
  :standard-input t
  :working-directory flycheck-erblint--working-directory
  :error-parser flycheck-erblint--parse-json
  :modes (web-mode)
  :predicate flycheck-erblint--is-erb-file)

;;;###autoload
(defun flycheck-erblint-setup ()
  "Setup Flycheck erblint."
  (interactive)
  (add-to-list 'flycheck-checkers 'erblint))

(provide 'flycheck-erblint)
;;; flycheck-erblint.el ends here
