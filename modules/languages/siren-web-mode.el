;;; siren-web-mode.el --- jimeh's Emacs Siren: web-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for web-mode.

;;; Code:

(require 'siren-display-fill-column)
(require 'siren-hideshow)
(require 'siren-flycheck-erblint)
(require 'siren-erblintfmt)

(use-package web-mode
  :mode
  "\\.html\\'"
  "\\.html.erb\\'"
  "\\.tpl\\'"

  :general
  (:keymaps 'web-mode-map
            "C-j" 'newline-and-indent
            "C-c C-f" 'siren-web-mode-format-buffer)

  :hook
  (web-mode . siren-web-mode-setup)

  :custom
  (web-mode-code-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-attr-indent-offset 2)
  (web-mode-sql-indent-offset 2)
  (web-mode-engines-alist '(("go" . "\\.tpl\\'")))

  :preface
  (defun siren-web-mode-setup ()
    "Default tweaks for `web-mode'."
    (setq-local tab-width 2)

    (when (version< emacs-version "27.0")
      (siren-display-fill-column -1))

    (hs-minor-mode t))

  (defun siren-web-mode-format-buffer ()
    "Format the current buffer using relevant tool."
    (interactive)
    (pcase (file-name-extension (buffer-file-name))
      ("erb" (erblintfmt))
      (_ (message "No formatting tool available for this file type"))))

  :config
  (flycheck-erblint-setup))

(provide 'siren-web-mode)
;;; siren-web-mode.el ends here
