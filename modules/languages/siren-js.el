;;; siren-js.el --- jimeh's Emacs Siren: js-mode configuration.

;;; Commentary:

;; Basic configuration for js-mode.

;;; Code:

(require 'siren-company)
(require 'siren-folding)
(require 'siren-lsp)

(use-package js-mode
  :straight (:type built-in)
  :mode
  "\\.js\\'"
  "\\.pac\\'"

  :bind (:map js-mode-map
              ("C-j" . newline-and-indent)
              ("C-c C-h" . siren-toggle-hiding))

  :hook
  (js-mode . siren-js-mode-setup)

  :init
  (defun siren-js-mode-setup ()
    "Default tweaks for `js-mode'."
    (let ((width 2))
      (setq js-indent-level width
            indent-level width
            tab-width width))

    (company-mode)
    (subword-mode)
    (siren-folding)))

(use-package lsp-javascript
  :straight lsp-mode

  :hook
  (js-mode . siren-lsp-js-mode-setup)

  :init
  (defun siren-lsp-js-mode-setup ()
    (lsp-deferred)
    (lsp-format-buffer-on-save-mode)))

(provide 'siren-js)
;;; siren-js.el ends here
