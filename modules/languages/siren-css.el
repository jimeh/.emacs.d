;;; siren-css.el --- jimeh's Emacs Siren: css-mode configuration.

;;; Commentary:

;; Basic configuration for css-mode.

;;; Code:

(require 'siren-company)
(require 'siren-lsp)
(require 'siren-prettier-js)
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
    (prettier-js-mode)
    (lsp)
    (rainbow-mode +1)))

(provide 'siren-css)
;;; siren-css.el ends here
