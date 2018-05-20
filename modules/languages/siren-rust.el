;;; siren-rust.el --- jimeh's Emacs Siren: rust-mode configuration.

;;; Commentary:

;; Basic configuration for rust-mode.

;;; Code:

(require 'siren-folding)
(require 'siren-highlight-indentation)

(use-package rust-mode
  :mode "\\.rs\\'"
  :interpreter "rust"
  :commands rust-mode
  :bind (:map rust-mode-map
              ("RET" . newline-and-indent))

  :hook
  (rust-mode . siren-rust-mode-setup)

  :init
  (defun siren-rust-mode-setup ()
    (setq rust-format-on-save t)

    (hs-minor-mode 1)
    (hideshowvis-enable)
    (highlight-indentation-current-column-mode)
    (subword-mode +1)))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package racer
  :requires rust-mode company
  :commands racer-mode
  :bind (:map rust-mode-map
              ("TAB" . company-indent-or-complete-common))

  :hook
  (rust-mode . racer-mode)
  (racer-mode . eldoc-mode)
  (racer-mode . siren-racer-mode-setup)

  :config
  (defun siren-racer-mode-setup ()
    (setq company-tooltip-align-annotations t)))

(use-package rust-playground)

(provide 'siren-rust)
;;; siren-rust.el ends here
