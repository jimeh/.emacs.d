;;; siren-dockerfile.el --- jimeh's Emacs Siren: dockerfile-mode configuration.

;;; Commentary:

;; Basic configuration for dockerfile-mode.

;;; Code:

(require 'siren-lsp)

(defun siren-dockerfile-mode-setup ()
  "Shared setup for both `dockerfile-mode' and `dockerfile-ts-mode'."
  ;; Disable vue-semantic-server as it is very aggressive and activates in all
  ;; files within projects that uses vue, preventing the lsp servers for other
  ;; file types from working.
  (setq-local lsp-disabled-clients '(vue-semantic-server))

  ;; Disable semantic tokens as it typically causes an annoying delay with the
  ;; syntax highlighting as you type. Essentially all new text is a very faded
  ;; out grey color for the first 1-2 seconds as you type.
  (setq-local lsp-semantic-tokens-enable nil)

  (lsp)
  (lsp-format-buffer-on-save-mode +1)
  (when (fboundp 'flycheck-select-checker)
    (flycheck-select-checker 'hadolint)
    (flycheck-add-next-checker 'hadolint 'lsp)))

(defun siren-flycheck-setup-hadolint()
  "Setup hadolint flycheck checker.

This is a fixed Hadolint checker. The checker built-in to
flycheck expects lines to start with \"<filename>:\", but when
input is provided via STDIN, the each line starts with \"-:\"."
  (with-eval-after-load 'flycheck
    (flycheck-def-executable-var hadolint "hadolint")
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
      :modes (dockerfile-mode dockerfile-ts-mode))
    (add-to-list 'flycheck-checkers 'hadolint)))

(use-package dockerfile-mode
  :hook
  (dockerfile-mode . siren-dockerfile-mode-setup)
  :config
  (siren-flycheck-setup-hadolint))

;;; Disabled setup for dockerfile-ts-mode. It's not as mature as dockerfile-mode,
;;; so we don't enable it as the default mode for Dockerfiles.
;;;
;; (when (fboundp 'dockerfile-ts-mode)
;;   (require 'siren-treesit)
;;   (use-package dockerfile-ts-mode
;;     :straight (:type built-in)
;;     :mode
;;     "[/\\]\\(?:Containerfile\\|Dockerfile\\)\\(?:\\.[^/\\]*\\)?\\'"
;;     "\\.dockerfile\\'"
;;     :hook
;;     (dockerfile-ts-mode . siren-dockerfile-mode-setup)
;;
;;     :config
;;     (siren-flycheck-setup-hadolint)
;;
;;     ;; Remove auto-mode-alist entry added by dockerfile-ts-mode, as it's too
;;     ;; greedy and matches on files such as "siren-dockerfile.el" which is a
;;     ;; problem when trying to edit this file for example.
;;     (setq auto-mode-alist
;;           (delete '("\\(?:Dockerfile\\(?:\\..*\\)?\\|\\.[Dd]ockerfile\\)\\'"
;;                     . dockerfile-ts-mode)
;;                   auto-mode-alist))))

(provide 'siren-dockerfile)
;;; siren-dockerfile.el ends here
