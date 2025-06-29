;;; siren-typescript.el --- jimeh's Emacs Siren: typescript-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for typescript-mode.

;;; Code:

;; Requires Emacs 29.x or later for built-in treesit support.
(when (fboundp 'typescript-ts-mode)
  (require 'siren-flycheck)
  (require 'siren-js)
  (require 'siren-lsp)
  (require 'siren-treesit)

  (use-package typescript-ts-mode
    :straight (:type built-in)
    :mode "\\.ts\\'"
    :hook
    (typescript-ts-mode . siren-typescript-mode-setup)
    (typescript-ts-mode . siren-lsp-js-mode-setup)

    :custom
    (typescript-ts-mode-indent-offset 2)

    :config
    (siren-treesit-auto-ensure-grammar 'typescript))

  (use-package tsx-ts-mode
    :straight (:type built-in)
    :mode "\\.tsx\\'"
    :hook
    (tsx-ts-mode . siren-lsp-js-mode-setup)
    :config
    (siren-treesit-auto-ensure-grammar 'tsx)))

(provide 'siren-typescript)
;;; siren-typescript.el ends here
