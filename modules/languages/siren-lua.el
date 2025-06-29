;;; siren-lua.el --- jimeh's Emacs Siren: lua-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for lua-mode.

;;; Code:

(require 'siren-treesit)

(use-package lua-mode
  :hook
  (lua-mode . siren-lua-mode-setup)

  :custom
  (lua-indent-level 2)

  :preface
  (defun siren-lua-mode-setup ()))

(when (fboundp 'lua-ts-mode)
  (use-package lua-ts-mode
    :straight (:type built-in)
    :mode "\\.lua\\'"
    :hook
    (lua-ts-mode . siren-lua-ts-mode-setup)

    :general
    (:keymaps 'lua-ts-mode-map
              "C-j" 'newline-and-indent)

    :custom
    (lua-ts-indent-offset 2)

    :preface
    (defun siren-lua-ts-mode-setup ()
      (siren-treesit-replace-font-lock-settings
       :default-language 'lua
       ;; Use constant face for property names.
       :feature 'property
       '((field name: (identifier) @font-lock-constant-face)
         (dot_index_expression
          field: (identifier) @font-lock-constant-face))))

    :config
    (siren-treesit-auto-ensure-grammar 'lua)))

(use-package lsp-lua
  :straight lsp-mode

  :hook
  (lua-mode . siren-lsp-lua-mode-setup)
  (lua-ts-mode . siren-lsp-lua-mode-setup)

  :custom
  (lsp-lua-hint-enable t)
  (lsp-lua-telemetry-enable nil)

  :preface
  (defun siren-lsp-lua-mode-setup ()
    (setq-local tab-width 2)

    ;; Disable semantic tokens as it typically causes an annoying delay with the
    ;; syntax highlighting as you type. Essentially all new text is a very faded
    ;; out grey color for the first 1-2 seconds as you type.
    (setq-local lsp-semantic-tokens-enable nil)

    (lsp-format-buffer-on-save-mode t)
    (lsp-deferred)))

(provide 'siren-lua)
;;; siren-lua.el ends here
