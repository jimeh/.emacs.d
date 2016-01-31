;;; siren-yaml.el --- jimeh's Emacs Siren: yaml-mode configuration.

;;; Commentary:

;; Basic configuration for yaml-mode.

;;; Code:

(siren-require-package 'yaml-mode)

(require 'siren-programming)

(defun siren-yaml-mode-defaults ()
  (siren-prog-mode-defaults)

  (subword-mode +1)
  (setq tab-width 2)
  (highlight-indentation-set-offset 2)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode)
  (setq whitespace-action (quote (auto-cleanup)))
  (define-key yaml-mode-map (kbd "RET") 'newline-and-indent))

(setq siren-yaml-mode-hook 'siren-yaml-mode-defaults)

(add-hook 'yaml-mode-hook (lambda ()
                          (run-hooks 'siren-yaml-mode-hook)))

(provide 'siren-yaml)
;;; siren-yaml.el ends here
