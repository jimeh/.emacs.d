;;; siren-cucumber.el --- jimeh's Emacs Siren: feature-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for feature-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package feature-mode
  :mode "\\.feature\\'"
  :interpreter "cucumber"
  :hook (feature-mode . siren-feature-mode-setup)

  :preface
  (defun siren-feature-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq-local tab-width 2)))

(provide 'siren-cucumber)
;;; siren-cucumber.el ends here
