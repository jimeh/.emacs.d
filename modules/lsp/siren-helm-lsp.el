;;; siren-helm-lsp.el --- jimeh's Emacs Siren: helm-lsp configuration.

;;; Commentary:

;; Basic configuration for helm-lsp.

;;; Code:

(require 'siren-helm)
(require 'siren-lsp)

(use-package helm-lsp
  :commands
  helm-lsp-workspace-symbol
  helm-lsp-global-workspace-symbol
  :bind
  ("C-c C-'" . helm-lsp-workspace-symbol))

(provide 'siren-helm-lsp)
;;; siren-helm-lsp.el ends here
