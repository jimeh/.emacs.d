;;; siren-sass.el --- jimeh's Emacs Siren: sass-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for sass-mode.

;;; Code:

(require 'siren-css)

(use-package sass-mode
  :mode "\\.sass\\'"

  :hook
  (sass-mode . siren-sass-mode-setup)

  :custom
  ;; Turn off annoying auto-compile on save.
  (sass-compile-at-save nil)

  :preface
  (defun siren-sass-mode-setup ()
    (siren-css-mode-css)))

(provide 'siren-sass)
;;; siren-sass.el ends here
