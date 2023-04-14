;;; siren-typescript.el --- jimeh's Emacs Siren: typescript-mode configuration.

;;; Commentary:

;; Basic configuration for typescript-mode.

;;; Code:

(require 'siren-flycheck)
(require 'siren-lsp)
(require 'siren-treesit)

(let ((repo "https://github.com/tree-sitter/tree-sitter-typescript")
      (ref "v0.20.2"))
  (siren-treesit-prepare
   'typescript-ts-mode
   `(typescript . (,repo ,ref "typescript/src")))
  (siren-treesit-prepare
   'tsx-ts-mode
   `(tsx . (,repo ,ref "tsx/src"))))

(use-package typescript-ts-mode
  :straight (:type built-in)
  :mode "\\.ts\\'"
  :hook
  (typescript-ts-mode . siren-typescript-mode-setup))

(use-package tsx-ts-mode
  :straight (:type built-in)
  :mode "\\.tsx\\'"
  :hook
  (typescript-mode . siren-typescript-mode-setup))

(defun siren-typescript-mode-setup ()
  "Default setup function for `typescript-mode' and `typescript-ts-mode'."
  (let ((width 2))
    (setq-local typescript-indent-level width
                indent-level width
                tab-width width))

  (lsp-deferred)
  (flycheck-mode t))

(provide 'siren-typescript)
;;; siren-typescript.el ends here
