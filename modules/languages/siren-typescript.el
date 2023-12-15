;;; siren-typescript.el --- jimeh's Emacs Siren: typescript-mode configuration.

;;; Commentary:

;; Basic configuration for typescript-mode.

;;; Code:

;; Requires Emacs 29.x or later for built-in treesit support.
(when (fboundp 'typescript-ts-mode)
  (require 'siren-flycheck)
  (require 'siren-lsp)
  (require 'siren-treesit)

  (use-package typescript-ts-mode
    :straight (:type built-in)
    :mode "\\.ts\\'"
    :hook
    (typescript-ts-mode . siren-typescript-mode-setup)

    :config
    (siren-treesit-auto-ensure-grammar 'typescript))

  (use-package tsx-ts-mode
    :straight (:type built-in)
    :mode "\\.tsx\\'"
    :config
    (siren-treesit-auto-ensure-grammar 'tsx))

  (defun siren-typescript-mode-setup ()
    "Default setup function for `typescript-ts-mode' and `tsx-ts-mode'."
    (let ((width 2))
      (setq-local typescript-indent-level width
                  indent-level width
                  tab-width width))

    ;; Disable semantic tokens as it typically causes an annoying delay with the
    ;; syntax highlighting as you type. Essentially all new text is a very faded
    ;; out grey color for the first 1-2 seconds as you type.
    (setq-local lsp-semantic-tokens-enable nil)

    (lsp-format-buffer-on-save-mode t)
    (lsp-deferred)
    (flycheck-mode t)))

(provide 'siren-typescript)
;;; siren-typescript.el ends here
