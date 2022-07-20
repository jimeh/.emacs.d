;;; siren-jsx.el --- jimeh's Emacs Siren: .jsx file configuration

;;; Commentary:

;; Basic configuration for dealing with .jsx files.

;;; Code:

(require 'siren-origami)
(require 'siren-prettier-js)

(use-package rjsx-mode
  :mode "components\\/.*\\.js\\'"

  :hook (rjsx-mode . siren-rjsx-mode-setup)

  :preface
  (defun siren-rjsx-mode-setup ()
    (prettier-js-mode +1)
    (origami-mode t)
    (subword-mode t))

  :init
  (with-eval-after-load 'origami
    (add-to-list 'origami-parser-alist
                 '(rjsx-mode . origami-c-style-parser))))

(provide 'siren-jsx)
;;; siren-jsx.el ends here
