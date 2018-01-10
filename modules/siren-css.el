;;; siren-css.el --- jimeh's Emacs Siren: css-mode configuration.

;;; Commentary:

;; Basic configuration for css-mode.

;;; Code:

(require 'siren-programming)
(require 'siren-rainbow)

(use-package css-mode
  :mode "\\.css\\'"
  :config
  (setq css-indent-offset 2)

  (defun siren-css-mode-defaults ()
    (siren-prog-mode-defaults)
    (rainbow-mode +1)
    (setq tab-width 2)
    (highlight-indentation-current-column-mode))

  (setq siren-css-mode-hook 'siren-css-mode-defaults)
  (add-hook 'css-mode-hook (lambda ()
                             (run-hooks 'siren-css-mode-hook))))

(provide 'siren-css)
;;; siren-css.el ends here
