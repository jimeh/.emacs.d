;;; siren-lsp-ui.el --- jimeh's Emacs Siren: lsp-ui configuration.

;;; Commentary:

;; Basic configuration for lsp-ui.

;;; Code:

(require 'siren-lsp)

(use-package lsp-ui
  :commands lsp-ui-mode

  :bind (:map lsp-ui-mode-map
              ("C-c C-d" . lsp-ui-doc-show)
              ("M-?" . lsp-ui-peek-find-references)
              ("C-c C-j" . lsp-ui-peek-find-definitions))

  :hook
  (lsp-mode . lsp-ui-mode)

  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-enable nil))

(provide 'siren-lsp-ui)
;;; siren-lsp-ui.el ends here
