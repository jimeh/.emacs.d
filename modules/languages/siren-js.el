;;; siren-js.el --- jimeh's Emacs Siren: js-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for js-mode.

;;; Code:

(require 'siren-lsp)

(use-package js-mode
  :straight (:type built-in)
  :mode "\\.js\\'" "\\.pac\\'"

  :general
  (:keymaps 'js-mode-map
            "C-j" 'newline-and-indent)

  :hook
  (js-mode . siren-js-mode-setup)

  :custom
  (js-indent-level 2)

  :preface
  (defun siren-js-mode-setup ()
    "Default tweaks for `js-mode'."
    (setq-local indent-level js-indent-level
                tab-width js-indent-level)))

(when (fboundp 'js-ts-mode)
  (use-package js-ts-mode
    :straight (:type built-in)
    ;;; Disable, as js-ts-mode is quite underbaked and lacks a lot of syntax
    ;;; highlighting features compared to js-mode, and even more when
    ;;; tree-sitter-mode is added as well.
    ;; :mode "\\.js\\'" "\\.pac\\'"

    :hook
    (js-ts-mode . siren-js-ts-mode-setup)

    :general
    (:keymaps 'js-ts-mode-map
              "C-j" 'newline-and-indent)

    :custom
    (js-indent-level 2)

    :preface
    (defun siren-js-ts-mode-setup ())

    :config
    (siren-treesit-auto-ensure-grammar 'javascript)))

(use-package lsp-javascript
  :straight lsp-mode

  :hook
  (js-mode . siren-lsp-js-mode-setup)
  (js-ts-mode . siren-lsp-js-mode-setup)

  :preface
  (defun siren-lsp-js-mode-setup ()
    ;; Disable semantic tokens as it typically causes an annoying delay with the
    ;; syntax highlighting as you type. Essentially all new text is a very faded
    ;; out grey color for the first 1-2 seconds as you type.
    (setq-local lsp-semantic-tokens-enable nil)

    (lsp-deferred)
    (lsp-format-buffer-on-save-mode)))

(provide 'siren-js)
;;; siren-js.el ends here
