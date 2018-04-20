;;; siren-haml.el --- jimeh's Emacs Siren: haml-mode configuration.

;;; Commentary:

;; Basic configuration for haml-mode.

;;; Code:

(use-package haml-mode
  :mode "\\.haml\\'" "\\.hamlc\\'"
  :hook (haml-mode . siren-haml-mode-setup)

  :init
  (defun siren-haml-mode-setup ()
    (siren-prog-mode-setup)
    (setq tab-width 2)
    (highlight-indentation-set-offset 2)
    (highlight-indentation-current-column-mode)))

(provide 'siren-haml)
;;; siren-haml.el ends here
