;;; siren-jsx.el --- jimeh's Emacs Siren: .jsx file configuration

;;; Commentary:

;; Basic configuration for dealing with .jsx files.

;;; Code:

(require 'siren-folding)
(require 'siren-prettier-js)

(use-package rjsx-mode
  :mode "components\\/.*\\.js\\'"

  :hook (rjsx-mode . siren-rjsx-mode-setup)

  :preface
  (defun siren-rjsx-mode-setup ()
    (prettier-js-mode +1)
    (subword-mode +1)
    (siren-folding)))

(provide 'siren-jsx)
;;; siren-jsx.el ends here
