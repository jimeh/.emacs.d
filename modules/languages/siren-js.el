;;; siren-js.el --- jimeh's Emacs Siren: js-mode configuration.

;;; Commentary:

;; Basic configuration for js-mode.

;;; Code:

(require 'siren-folding)
(require 'siren-lsp)
(require 'siren-tree-sitter)

(use-package js-mode
  :straight (:type built-in)
  :mode
  "\\.js\\'"
  "\\.pac\\'"

  :general
  (:keymaps 'js-mode-map
            "C-j" 'newline-and-indent
            "C-c C-h" 'siren-toggle-hiding)

  :hook
  (js-mode . siren-js-mode-setup)

  :preface
  (defun siren-js-mode-setup ()
    "Default tweaks for `js-mode'."
    (let ((width 2))
      (setq js-indent-level width
            indent-level width
            tab-width width))

    (tree-sitter-mode +1)
    (subword-mode)
    (siren-folding)))

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
