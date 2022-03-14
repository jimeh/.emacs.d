;;; siren-helm-lsp.el --- jimeh's Emacs Siren: helm-lsp configuration.

;;; Commentary:

;; Basic configuration for helm-lsp.

;;; Code:

(require 'siren-helm)
(require 'siren-lsp)

(use-package helm-lsp
  :after (helm-global-bindings)
  :general
  ("C-c '" 'helm-lsp-workspace-symbol)
  ("C-c C-'" 'helm-lsp-workspace-symbol)
  ("C-c \\" 'helm-lsp-diagnostics))

(provide 'siren-helm-lsp)
;;; siren-helm-lsp.el ends here
