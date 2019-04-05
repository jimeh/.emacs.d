;;; siren-groovy.el --- jimeh's Emacs Siren: groovy-mode configuration.

;;; Commentary:

;; Basic configuration for groovy-mode.

;;; Code:

(use-package groovy-mode
  :hook
  (groovy-mode . siren-groovy-mode-setup)

  :init
  (defun siren-groovy-mode-setup ()
    (setq groovy-highlight-assignments t
          groovy-indent-offset 4
          tab-width 4)

    (highlight-indentation-current-column-mode)
    (subword-mode +1)))

(provide 'siren-groovy)
;;; siren-groovy.el ends here
