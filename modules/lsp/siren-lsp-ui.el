;;; siren-lsp-ui.el --- jimeh's Emacs Siren: lsp-ui configuration.

;;; Commentary:

;; Basic configuration for lsp-ui.

;;; Code:

(require 'siren-lsp)

(use-package lsp-ui
  :defer t
  :bind (:map lsp-ui-mode-map
              ("C-c C-d" . lsp-ui-doc-glance)
              ("C-c d" . lsp-ui-doc-show)
              ("M-?" . lsp-ui-peek-find-references)
              ("C-c C-j" . lsp-ui-peek-find-definitions))

  :custom
  (lsp-ui-doc-alignment 'window)
  (lsp-ui-doc-delay 0)
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header nil)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-max-height 45)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-use-webkit nil)
  (lsp-ui-sideline-enable nil))

(provide 'siren-lsp-ui)
;;; siren-lsp-ui.el ends here
