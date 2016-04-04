;;; siren-cucumber.el --- jimeh's Emacs Siren: feature-mode configuration.

;;; Commentary:

;; Basic configuration for feature-mode.

;;; Code:

(require 'siren-programming)

(siren-require-packages '(feature-mode))

(defun siren-feature-mode-defaults ()
  (siren-prog-mode-defaults)
  (setq tab-width 2)
  (highlight-indentation-set-offset 2)
  (highlight-indentation-current-column-mode))

(setq siren-feature-mode-hook 'siren-feature-mode-defaults)

(add-hook 'feature-mode-hook (lambda ()
                               (run-hooks 'siren-feature-mode-hook)))

(provide 'siren-cucumber)
;;; siren-cucumber.el ends here
