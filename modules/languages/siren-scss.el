;;; siren-scss.el --- jimeh's Emacs Siren: scss-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for scss-mode.

;;; Code:

(require 'siren-css)

(use-package scss-mode
  :mode "\\.scss\\'"

  :hook
  (scss-mode . siren-scss-mode-setup)

  :custom
  ;; Turn off annoying auto-compile on save.
  (scss-compile-at-save nil)

  :preface
  (defun siren-scss-mode-setup ()
    (siren-css-mode-setup)))

(provide 'siren-scss)
;;; siren-scss.el ends here
