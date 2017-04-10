;;; siren-org.el --- jimeh's Emacs Siren: org-mode configuration.

;;; Commentary:

;; Basic configuration for org-mode.

;;; Code:

(require 'siren-fci)
(require 'siren-smartparens)

(defun siren-org-mode-defaults ()
  (setq fill-column 80)
  (linum-mode t)
  (flyspell-mode)
  (fci-mode)
  (smartparens-mode +1)
  (setq whitespace-action (quote (auto-cleanup)))
  (visual-line-mode +1)
  (whitespace-mode +1))

(setq siren-org-mode-hook 'siren-org-mode-defaults)

(add-hook 'org-mode-hook (lambda ()
                           (run-hooks 'siren-org-mode-hook)))

(provide 'siren-org)
;;; siren-org.el ends here
