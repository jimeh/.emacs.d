;;; siren-helm-swoop.el --- jimeh's Emacs Siren: helm-swoop configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for helm-swoop.

;;; Code:

(require 'siren-helm)

(use-package helm-swoop
  :after (helm-global-bindings)
  :general
  ("M-r" 'helm-swoop-without-pre-input)
  ("M-R" 'helm-swoop-back-to-last-point)
  ("C-c M-r" 'helm-multi-swoop)
  ("C-x M-r" 'helm-multi-swoop-all))

(provide 'siren-helm-swoop)
;;; siren-helm-swoop.el ends here
