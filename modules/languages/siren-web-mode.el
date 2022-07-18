;;; siren-web-mode.el --- jimeh's Emacs Siren: web-mode configuration.

;;; Commentary:

;; Basic configuration for web-mode.

;;; Code:

(require 'siren-display-fill-column)
(require 'siren-folding)

(use-package web-mode
  :mode
  "\\.html\\'"
  "\\.html.erb\\'"
  "\\.tpl\\'"

  :general
  (:keymaps 'web-mode-map
            "C-j" 'newline-and-indent
            "C-c C-h" 'siren-folding-toggle)

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

    (siren-folding)
    (subword-mode +1)
    (lsp-deferred)))

(provide 'siren-web-mode)
;;; siren-web-mode.el ends here
