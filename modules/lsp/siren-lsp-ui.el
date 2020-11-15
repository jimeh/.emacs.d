;;; siren-lsp-ui.el --- jimeh's Emacs Siren: lsp-ui configuration.

;;; Commentary:

;; Basic configuration for lsp-ui.

;;; Code:

(require 'siren-lsp)

(use-package lsp-ui
  :defer t
  :bind (:map lsp-ui-mode-map
              ("C-c C-d" . lsp-ui-doc-glance)
              ("M-?" . lsp-ui-peek-find-references)
              ("C-c C-j" . lsp-ui-peek-find-definitions))

  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-enable nil)
  (lsp-ui-doc-alignment 'window)
  (lsp-ui-doc-delay 0)
  (lsp-ui-doc-header nil)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-use-webkit nil))

(provide 'siren-lsp-ui)
;;; siren-lsp-ui.el ends here
