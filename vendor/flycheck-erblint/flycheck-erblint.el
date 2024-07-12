;;; flycheck-erblint.el --- Check files with erblint via flycheck.

;; Copyright (C) 2024 Jim Myhrberg

;; Author: Jim Myhrberg <contact@jimeh.me>
;; Keywords: language, linting, tools

;;; Commentary:

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
  :command ("erblint" "--format" "json"
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
