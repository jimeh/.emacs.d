;;; siren-helm-lsp.el --- jimeh's Emacs Siren: helm-lsp configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for helm-lsp.

;;; Code:

(require 'siren-helm)
(require 'siren-lsp)

(use-package helm-lsp
  :general
  ("C-c '" 'helm-lsp-workspace-symbol)
  ("C-c C-'" 'helm-lsp-workspace-symbol)
  ("C-c \\" 'helm-lsp-diagnostics))

(provide 'siren-helm-lsp)
;;; siren-helm-lsp.el ends here
