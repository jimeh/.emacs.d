;;; siren-css.el --- jimeh's Emacs Siren: css-mode configuration.

;;; Commentary:

;; Basic configuration for css-mode.

;;; Code:

(use-package css-mode
  :mode "\\.css\\'"
  :config
  (use-package rainbow-mode)
  (require 'siren-programming)

  (setq css-indent-offset 2)

  (defun siren-css-mode-defaults ()
    (siren-prog-mode-defaults)
    (rainbow-mode +1)
    (setq tab-width 2)
    (highlight-indentation-current-column-mode)
    (run-hooks 'siren-prog-mode-hook))

  (setq siren-css-mode-hook 'siren-css-mode-defaults)
  (add-hook 'css-mode-hook (lambda ()
                             (run-hooks 'siren-css-mode-hook))))

(provide 'siren-css)
;;; siren-css.el ends here
