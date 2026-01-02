;;; siren-dockerfile.el --- jimeh's Emacs Siren: dockerfile-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for dockerfile-mode.

;;; Code:

(require 'siren-flycheck)
(require 'siren-lsp)

(use-package dockerfile-mode
  :hook
  (dockerfile-mode . siren-dockerfile-mode-setup)

  :preface
  (defun siren-dockerfile-mode-setup ()))

(when (fboundp 'dockerfile-ts-mode)
  (require 'siren-treesit)
  (use-package dockerfile-ts-mode
    :ensure nil
    ;;; Disabled setup for dockerfile-ts-mode. It's not as mature as
    ;;; dockerfile-mode, so we don't enable it as the default mode for
    ;;; Dockerfiles.
    ;; :mode
    ;; "[/\\]\\(?:Containerfile\\|Dockerfile\\)\\(?:\\.[^/\\]*\\)?\\'"
    ;; "\\.dockerfile\\'"
    :hook
    (dockerfile-ts-mode . siren-dockerfile-mode-setup)

    :config
    (siren-treesit-auto-ensure-grammar 'dockerfile)

    ;; Remove auto-mode-alist entry added by dockerfile-ts-mode, as it's too
    ;; greedy and matches on files such as "siren-dockerfile.el" which is a
    ;; problem when trying to edit this file for example.
    (setq auto-mode-alist
          (delete '("\\(?:Dockerfile\\(?:\\..*\\)?\\|\\.[Dd]ockerfile\\)\\'"
                    . dockerfile-ts-mode)
                  auto-mode-alist))))

(use-package lsp-dockerfile
  :ensure nil
  :defer t
  :hook
  (dockerfile-mode . siren-lsp-dockerfile-mode-setup)
  (dockerfile-ts-mode . siren-lsp-dockerfile-mode-setup)

  :preface
  (defun siren-lsp-dockerfile-mode-setup ()
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
    (lsp-diagnostics-mode +1)
    (lsp-format-buffer-on-save-mode +1)
    (when (fboundp 'flycheck-select-checker)
      (flycheck-select-checker 'dockerfile-hadolint)
      (flycheck-add-next-checker 'dockerfile-hadolint 'lsp))))

(provide 'siren-dockerfile)
;;; siren-dockerfile.el ends here
