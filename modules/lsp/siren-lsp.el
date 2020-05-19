;;; siren-lsp.el --- jimeh's Emacs Siren: lsp-mode configuration.

;;; Commentary:

;; Basic configuration for lsp-mode.

;;; Code:

(use-package lsp-mode
  :defer t
  :bind (:map lsp-mode-map
              ("C-c C-." . lsp-rename)
              ("C-c C-f" . lsp-format-buffer))

  :hook
  (lsp-mode . siren-lsp-mode-setup)

  :custom
  (lsp-keymap-prefix "M-;")
  (lsp-eldoc-render-all nil)

  :init
  (defun siren-lsp-mode-setup ()
    (setq-local company-idle-delay 0.0
                company-minimum-prefix-length 1)))

(provide 'siren-lsp)
;;; siren-lsp.el ends here
