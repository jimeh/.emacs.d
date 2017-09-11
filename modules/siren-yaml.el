;;; siren-yaml.el --- jimeh's Emacs Siren: yaml-mode configuration.

;;; Commentary:

;; Basic configuration for yaml-mode.

;;; Code:

(use-package yaml-mode
  :mode "\\.yml\\'" "\\.yaml\\'"
  :config
  (require 'siren-programming)

  (defun siren-yaml-mode-defaults ()
    (siren-prog-mode-defaults)
    (setq tab-width 2
          whitespace-action '(auto-cleanup))

    (highlight-indentation-set-offset 2)
    (highlight-indentation-current-column-mode)
    (subword-mode +1)
    (define-key yaml-mode-map (kbd "RET") 'newline-and-indent))

  (setq siren-yaml-mode-hook 'siren-yaml-mode-defaults)
  (add-hook 'yaml-mode-hook (lambda () (run-hooks 'siren-yaml-mode-hook))))

(provide 'siren-yaml)
;;; siren-yaml.el ends here
