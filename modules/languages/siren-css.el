;;; siren-css.el --- jimeh's Emacs Siren: css-mode configuration.

;;; Commentary:

;; Basic configuration for css-mode.

;;; Code:

(require 'siren-rainbow)

(use-package css-mode
  :mode "\\.css\\'"

  :hook
  (css-mode . siren-css-mode-setup)

  :custom
  (css-indent-offset 2)

  :init
  (defun siren-css-mode-setup ()
    (setq tab-width 2)

    (company-mode +1)
    (lsp)
    (rainbow-mode +1)))

(provide 'siren-css)
;;; siren-css.el ends here
