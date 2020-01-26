;;; siren-web-mode.el --- jimeh's Emacs Siren: web-mode configuration.

;;; Commentary:

;; Basic configuration for web-mode.

;;; Code:

(require 'siren-company)
(require 'siren-fci)
(require 'siren-folding)

(use-package web-mode
  :mode
  "\\.html\\'"
  "\\.html.erb\\'"
  "\\.tpl\\'"

  :bind (:map web-mode-map
              ("C-j" . newline-and-indent)
              ("C-c C-h" . siren-folding-toggle))

  :hook
  (web-mode . siren-web-mode-setup)

  :custom
  (web-mode-code-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-sql-indent-offset 2)
  (web-mode-engines-alist '(("go" . "\\.tpl\\'")))

  :init
  (defun siren-web-mode-setup ()
    "Default tweaks for `web-mode'."
    (setq tab-width 2)

    (company-mode +1)
    (fci-mode -1)
    (siren-folding)
    (subword-mode +1)))

(use-package web-beautify
  :bind (:map web-mode-map
              ("C-c C-f" . web-beautify-html)))

(provide 'siren-web-mode)
;;; siren-web-mode.el ends here
