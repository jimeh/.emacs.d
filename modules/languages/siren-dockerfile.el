;;; siren-dockerfile.el --- jimeh's Emacs Siren: dockerfile-mode configuration.

;;; Commentary:

;; Basic configuration for dockerfile-mode.

;;; Code:

(require 'siren-lsp)

(if (fboundp 'dockerfile-ts-mode)
    ;; Use built-in treesit support if available.
    (use-package dockerfile-ts-mode
      :straight (:type built-in)
      :mode
      "[/\\]\\(?:Containerfile\\|Dockerfile\\)\\(?:\\.[^/\\]*\\)?\\'"
      "\\.dockerfile\\'"
      :hook
      (dockerfile-ts-mode . siren-dockerfile-mode-setup)

      :init
      (require 'siren-treesit)
      (siren-treesit-prepare
       'dockerfile-ts-mode
       '(dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")))

  ;; Otherwise, fallback to regular dockerfile-mode.
  (use-package dockerfile-mode
    :hook
    (dockerfile-mode . siren-dockerfile-mode-setup)))

(defun siren-dockerfile-mode-setup ()
  "Shared setup for both `dockerfile-mode' and `dockerfile-ts-mode'."
  (lsp)
  (lsp-format-buffer-on-save-mode +1)
  (when (fboundp 'flycheck-select-checker)
    (flycheck-select-checker 'hadolint)
    (flycheck-add-next-checker 'hadolint 'lsp)))

;; Define fixed Hadolint checker, built-in checker expects lines to start
;; with "<filename>:", but when input is provided via STDIN, the each line
;; starts with "-:".
(with-eval-after-load 'flycheck
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
    :modes (dockerfile-mode dockerfile-ts-mode)))

(provide 'siren-dockerfile)
;;; siren-dockerfile.el ends here
