;;; siren-rust.el --- jimeh's Emacs Siren: rust-mode configuration.

;;; Commentary:

;; Basic configuration for rust-mode.

;;; Code:

(require 'siren-lsp)

(use-package rust-mode
  :mode "\\.rs\\'"
  :interpreter "rust"
  :commands rust-mode
  :general
  (:keymaps 'rust-mode-map
            "RET" 'newline-and-indent)

  :hook
  (rust-mode . siren-rust-mode-setup)

  :preface
  (defun siren-rust-mode-setup ()
    (setq-local rust-format-on-save t)

    (subword-mode t)))

(use-package lsp-rust
  :straight lsp-mode

  :hook
  (rust-mode . siren-lsp-rust-mode-setup)

  :preface
   (defun siren-lsp-rust-mode-setup ()
    (lsp-format-buffer-on-save-mode t)
    (lsp-organize-imports-on-save-mode t)
    (lsp-deferred)))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package rust-playground
  :defer t)

(provide 'siren-rust)
;;; siren-rust.el ends here
