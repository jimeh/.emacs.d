;;; siren-yaml.el --- jimeh's Emacs Siren: yaml-mode configuration.

;;; Commentary:

;; Basic configuration for yaml-mode.

;;; Code:

(require 'siren-programming)

(siren-require-package 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

(defun siren-yaml-mode-defaults ()
  (siren-prog-mode-defaults)

  (subword-mode +1)
  (setq tab-width 2)
  (highlight-indentation-set-offset 2)
  (highlight-indentation-current-column-mode)
  (setq whitespace-action (quote (auto-cleanup)))
  (define-key yaml-mode-map (kbd "RET") 'newline-and-indent))

(setq siren-yaml-mode-hook 'siren-yaml-mode-defaults)

(add-hook 'yaml-mode-hook (lambda ()
                          (run-hooks 'siren-yaml-mode-hook)))

(provide 'siren-yaml)
;;; siren-yaml.el ends here
