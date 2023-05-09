;;; siren-typescript.el --- jimeh's Emacs Siren: typescript-mode configuration.

;;; Commentary:

;; Basic configuration for typescript-mode.

;;; Code:

;; Requires Emacs 29.x or later for built-in treesit support.
(when (fboundp 'treesit-ready-p)
  (require 'siren-flycheck)
  (require 'siren-lsp)
  (require 'siren-treesit)

  (use-package typescript-ts-mode
    :straight (:type built-in)
    :mode "\\.ts\\'"
    :hook
    (typescript-ts-mode . siren-typescript-mode-setup)

    :config
    (when (not (treesit-ready-p 'typescript))
      (treesit-install-language-grammar 'typescript)))

  (use-package tsx-ts-mode
    :straight (:type built-in)
    :mode "\\.tsx\\'"
    :config
    (when (not (treesit-ready-p 'tsx))
      (treesit-install-language-grammar 'tsx)))

  (defun siren-typescript-mode-setup ()
    "Default setup function for `typescript-ts-mode' and `tsx-ts-mode'."
    (let ((width 2))
      (setq-local typescript-indent-level width
                  indent-level width
                  tab-width width))

    (lsp-deferred)
    (flycheck-mode t)))

(provide 'siren-typescript)
;;; siren-typescript.el ends here
