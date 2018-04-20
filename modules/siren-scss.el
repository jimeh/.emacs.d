;;; siren-scss.el --- jimeh's Emacs Siren: scss-mode configuration.

;;; Commentary:

;; Basic configuration for scss-mode.

;;; Code:

(require 'siren-css)

(use-package scss-mode
  :mode "\\.scss\\'"
  :hook (scss-mode-hook . siren-scss-mode-setup)

  :config
  ;; turn off annoying auto-compile on save
  (setq scss-compile-at-save nil)

  (defun siren-scss-mode-setup ()
    (siren-css-mode-setup)))

(provide 'siren-scss)
;;; siren-scss.el ends here
