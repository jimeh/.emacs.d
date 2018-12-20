;;; siren-lsp.el --- jimeh's Emacs Siren: lsp-mode configuration.

;;; Commentary:

;; Basic configuration for lsp-mode.

;;; Code:

(require 'siren-company)

(use-package lsp-mode
  :config
  (require 'lsp-clients)
  (setq lsp-eldoc-render-all nil))

(use-package company-lsp)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq  lsp-ui-doc-enable nil
         lsp-ui-sideline-enable nil))

(provide 'siren-lsp)
;;; siren-lsp.el ends here
