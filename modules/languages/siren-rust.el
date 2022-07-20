;;; siren-rust.el --- jimeh's Emacs Siren: rust-mode configuration.

;;; Commentary:

;; Basic configuration for rust-mode.

;;; Code:

(require 'siren-lsp)
(require 'siren-origami)
(require 'siren-tree-sitter)

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

    (tree-sitter-mode t)
    (lsp-deferred)
    (origami-mode t)
    (subword-mode t))

  :init
  (with-eval-after-load 'origami
    (add-to-list 'origami-parser-alist
                 '(rust-mode . origami-c-style-parser))))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package rust-playground
  :defer t)

(provide 'siren-rust)
;;; siren-rust.el ends here
