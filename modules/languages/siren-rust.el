;;; siren-rust.el --- jimeh's Emacs Siren: rust-mode configuration.

;;; Commentary:

;; Basic configuration for rust-mode.

;;; Code:

(require 'siren-folding)
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

  :init
  (defun siren-rust-mode-setup ()
    (setq rust-format-on-save t)

    (lsp-deferred)
    (siren-folding)
    (subword-mode +1)))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package rust-playground
  :defer t)

(provide 'siren-rust)
;;; siren-rust.el ends here
