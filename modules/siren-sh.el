;;; siren-sh.el --- jimeh's Emacs Siren: sh-mode configuration.

;;; Commentary:

;; Basic configuration for sh-mode.

;;; Code:

(require 'siren-programming)

(defun siren-sh-mode-defaults ()
  (siren-prog-mode-defaults)

  (subword-mode +1)
  (setq tab-width 2)
  (setq sh-basic-offset 2)
  (setq sh-indentation 2)
  (highlight-indentation-set-offset 2)
  (highlight-indentation-current-column-mode)
  (setq whitespace-action (quote (auto-cleanup)))
  (define-key sh-mode-map (kbd "RET") 'newline-and-indent))

(setq siren-sh-mode-hook 'siren-sh-mode-defaults)

(add-hook 'sh-mode-hook (lambda ()
                          (run-hooks 'siren-sh-mode-hook)))

(provide 'siren-sh)
;;; siren-sh.el ends here
