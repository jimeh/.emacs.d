;;; siren-css.el --- jimeh's Emacs Siren: css-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for css-mode.

;;; Code:

(require 'siren-lsp)

(use-package css-mode
  :ensure nil
  :mode "\\.css\\'"

  :hook
  (css-mode . siren-css-mode-setup)

  :custom
  (css-indent-offset 2)

  :custom-face
  (css-selector ((t (:inherit font-lock-keyword-face :foreground nil))))
  (css-property ((t (:inherit font-lock-constant-face :foreground nil))))

  :preface
  (defun siren-css-mode-setup ()
    (setq-local tab-width css-indent-offset)))

(when (fboundp 'css-ts-mode)
  (use-package css-ts-mode
    :ensure nil
    :mode "\\.css\\'"
    :hook
    (css-ts-mode . siren-css-ts-mode-setup)

    :general
    (:keymaps 'css-ts-mode-map
              "C-j" 'newline-and-indent)

    :custom
    (css-indent-offset 2)

    :custom-face
    (css-selector ((t (:inherit font-lock-keyword-face :foreground nil))))
    (css-property ((t (:inherit font-lock-constant-face :foreground nil))))

    :preface
    (defun siren-css-ts-mode-setup ()
      (setq-local tab-width css-indent-offset))

    :config
    (siren-treesit-auto-ensure-grammar 'css)))

(use-package lsp-css
  :ensure nil
  :defer t
  :hook
  (css-mode . siren-lsp-css-mode-setup)
  (css-ts-mode . siren-lsp-css-mode-setup)

  :preface
  (defun siren-lsp-css-mode-setup ()
    (lsp-deferred)))

(provide 'siren-css)
;;; siren-css.el ends here
