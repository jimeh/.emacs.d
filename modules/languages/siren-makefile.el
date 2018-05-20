;;; siren-makefile.el --- jimeh's Emacs Siren: makefile-mode configuration.

;;; Commentary:

;; Basic configuration for makefile-mode.

;;; Code:

(use-package make-mode
  :ensure nil ;; loaded from emacs built-ins
  :hook
  (makefile-mode-hook . siren-makefile-mode-setup)

  :init
  (add-to-list 'siren-indent-sensitive-modes 'makefile-mode)
  (defun siren-makefile-mode-setup ()
    (subword-mode +1)
    (setq tab-width 4)
    (highlight-indentation-set-offset 4)
    (highlight-indentation-current-column-mode)))

(provide 'siren-makefile)
;;; siren-makefile.el ends here
