;;; siren-js.el --- jimeh's Emacs Siren: js-mode configuration.

;;; Commentary:

;; Basic configuration for js-mode.

;;; Code:

(require 'siren-lsp)

(use-package js-mode
  :straight (:type built-in)
  :mode
  "\\.js\\'"
  "\\.pac\\'"

  :general
  (:keymaps 'js-mode-map
            "C-j" 'newline-and-indent)

  :hook
  (js-mode . siren-js-mode-setup)

  :preface
  (defun siren-js-mode-setup ()
    "Default tweaks for `js-mode'."
    (let ((width 2))
      (setq-local js-indent-level width
                  indent-level width
                  tab-width width))

    (subword-mode t)))

(use-package lsp-javascript
  :straight lsp-mode

  :hook
  (js-mode . siren-lsp-js-mode-setup)

  :preface
  (defun siren-lsp-js-mode-setup ()
    (lsp-deferred)
    (lsp-format-buffer-on-save-mode)))

(provide 'siren-js)
;;; siren-js.el ends here
