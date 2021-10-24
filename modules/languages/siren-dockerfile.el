;;; siren-dockerfile.el --- jimeh's Emacs Siren: dockerfile-mode configuration.

;;; Commentary:

;; Basic configuration for dockerfile-mode.

;;; Code:

(use-package dockerfile-mode
  :hook
  (dockerfile-mode . siren-dockerfile-mode-setup)

  :init
  (defun siren-dockerfile-mode-setup ()
    (with-eval-after-load 'flycheck
      (flycheck-select-checker 'hadolint))
    (subword-mode +1))

  (with-eval-after-load 'flycheck
    ;; Define fixed Hadolint checker, built-in checker expects lines to start
    ;; with "<filename>:", but when input is provided via STDIN, the each line
    ;; starts with "-:".
    (flycheck-define-checker hadolint
      "A Dockerfile syntax checker using the hadolint.

See URL `http://github.com/hadolint/hadolint/'."
      :command ("hadolint" "--no-color" "-")
      :standard-input t
      :error-patterns
      ((error line-start
              "-:" line " " (id (one-or-more alnum)) " error: " (message)
              line-end)
       (warning line-start
                "-:" line " " (id (one-or-more alnum))
                " warning: " (message) line-end)
       (info line-start
             "-:" line " " (id (one-or-more alnum)) " info: " (message)
             line-end)
       (error line-start
              "-:" line ":" column " " (message)
              line-end))
      :error-filter
      (lambda (errors)
        (flycheck-sanitize-errors
         (flycheck-remove-error-file-names "/dev/stdin" errors)))
      :modes dockerfile-mode)))

(provide 'siren-dockerfile)
;;; siren-dockerfile.el ends here
