;;; siren-groovy.el --- jimeh's Emacs Siren: groovy-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for groovy-mode.

;;; Code:

(use-package groovy-mode
  :mode "\\.groovy\\'"
  :hook
  (groovy-mode . siren-groovy-mode-setup)

  :preface
  (defun siren-groovy-mode-setup ()
    (setq-local groovy-highlight-assignments t
                groovy-indent-offset 4
                tab-width 4)))

(provide 'siren-groovy)
;;; siren-groovy.el ends here
