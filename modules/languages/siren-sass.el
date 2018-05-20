;;; siren-sass.el --- jimeh's Emacs Siren: sass-mode configuration.

;;; Commentary:

;; Basic configuration for sass-mode.

;;; Code:

(require 'siren-css)

(use-package sass-mode
  :mode "\\.sass\\'"
  :hook (sass-mode . siren-sass-mode-setup)

  :init
  (defun siren-sass-mode-setup ()
    (siren-css-mode-css))

  :config
  ;; turn off annoying auto-compile on save
  (setq sass-compile-at-save nil))

(provide 'siren-sass)
;;; siren-sass.el ends here
