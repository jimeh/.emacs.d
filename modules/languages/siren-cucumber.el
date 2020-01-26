;;; siren-cucumber.el --- jimeh's Emacs Siren: feature-mode configuration.

;;; Commentary:

;; Basic configuration for feature-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package feature-mode
  :mode "\\.feature\\'"
  :interpreter "cucumber"
  :hook (feature-mode . siren-feature-mode-setup)

  :init
  (defun siren-feature-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq tab-width 2)))

(provide 'siren-cucumber)
;;; siren-cucumber.el ends here
