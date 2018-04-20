;;; siren-cucumber.el --- jimeh's Emacs Siren: feature-mode configuration.

;;; Commentary:

;; Basic configuration for feature-mode.

;;; Code:

(require 'siren-programming)

(use-package feature-mode
  :mode "\\.feature\\'"
  :interpreter "cucumber"
  :hook (feature-mode . siren-feature-mode-setup)

  :init
  (defun siren-feature-mode-setup ()
    (siren-prog-mode-setup)
    (setq tab-width 2)
    (highlight-indentation-set-offset 2)
    (highlight-indentation-current-column-mode)))

(provide 'siren-cucumber)
;;; siren-cucumber.el ends here
