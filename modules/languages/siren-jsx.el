;;; siren-jsx.el --- jimeh's Emacs Siren: .jsx file configuration  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for dealing with .jsx files.

;;; Code:

(use-package rjsx-mode
  :mode "components\\/.*\\.js\\'"

  :hook (rjsx-mode . siren-rjsx-mode-setup)

  :preface
  (defun siren-rjsx-mode-setup ()))

(provide 'siren-jsx)
;;; siren-jsx.el ends here
