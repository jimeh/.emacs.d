;;; siren-yaml.el --- jimeh's Emacs Siren: yaml-mode configuration.

;;; Commentary:

;; Basic configuration for yaml-mode.

;;; Code:

(require 'siren-lsp)
(require 'siren-prog-mode)
(require 'siren-tree-sitter)

(use-package yaml-mode
  :mode "\\.yml\\'" "\\.yaml\\'"
  :general
  (:keyamps 'yaml-mode-map
            "RET" 'newline-and-indent)

  :hook
  (yaml-mode . siren-yaml-mode-setup)

  :preface
  (defun siren-yaml-mode-setup ()
    (run-hooks 'prog-mode-hook)

    (setq-local tab-width 2)
    (tree-sitter-mode t)
    (subword-mode t)))

(use-package lsp-yaml
  :straight lsp-mode

  :hook
  (yaml-mode . siren-lsp-yaml-mode-setup)

  :preface
  (defun siren-lsp-yaml-mode-setup ()
    (lsp-deferred)
    (lsp-format-buffer-on-save-mode)))

(use-package yaml-imenu
  :after yaml-mode
  :config
  (yaml-imenu-enable))

(provide 'siren-yaml)
;;; siren-yaml.el ends here
