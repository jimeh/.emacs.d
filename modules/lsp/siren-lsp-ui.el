;;; siren-lsp-ui.el --- jimeh's Emacs Siren: lsp-ui configuration.

;;; Commentary:

;; Basic configuration for lsp-ui.

;;; Code:

(require 'siren-lsp)

(use-package lsp-ui
  :commands lsp-ui-mode

  :hook
  (lsp-mode . lsp-ui-mode)

  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-enable nil))

(provide 'siren-lsp-ui)
;;; siren-lsp-ui.el ends here
