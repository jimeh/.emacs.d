;;; siren-sass.el --- jimeh's Emacs Siren: sass-mode configuration.

;;; Commentary:

;; Basic configuration for sass-mode.

;;; Code:

(require 'siren-css)

(use-package sass-mode
  :mode "\\.sass\\'"

  :config
  ;; turn off annoying auto-compile on save
  (setq sass-compile-at-save nil)

  (defun siren-sass-mode-defaults ()
    (siren-css-mode-defaults))

  (setq siren-sass-mode-hook 'siren-sass-mode-defaults)
  (add-hook 'sass-mode-hook (lambda () (run-hooks 'siren-sass-mode-hook))))

(provide 'siren-sass)
;;; siren-sass.el ends here
