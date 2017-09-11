;;; siren-haml.el --- jimeh's Emacs Siren: haml-mode configuration.

;;; Commentary:

;; Basic configuration for haml-mode.

;;; Code:

(use-package haml-mode
  :mode "\\.haml\\'" "\\.hamlc\\'"

  :config
  (defun siren-haml-mode-defaults ()
    (siren-prog-mode-defaults)
    (setq tab-width 2)
    (highlight-indentation-set-offset 2)
    (highlight-indentation-current-column-mode))

  (setq siren-haml-mode-hook 'siren-haml-mode-defaults)
  (add-hook 'haml-mode-hook (lambda () (run-hooks 'siren-haml-mode-hook))))

(provide 'siren-haml)
;;; siren-haml.el ends here
