;;; siren-company.el --- jimeh's Emacs Siren: company configuration.

;;; Commentary:

;; Basic configuration for company. Auto completion on steroids.

;;; Code:

(require 'siren-fci)

(use-package company
  :config

  ;; work-around for issues with fci-mode
  (defvar-local company-fci-mode-on-p nil)

  (defun company-turn-off-fci (&rest ignore)
    (when (boundp 'fci-mode)
      (setq company-fci-mode-on-p fci-mode)
      (when fci-mode (fci-mode -1))))

  (defun company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))

  (add-hook 'company-completion-started-hook 'company-turn-off-fci)
  (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)

  (setq company-begin-commands '(self-insert-command)
        company-dabbrev-downcase nil
        company-echo-delay 0
        company-idle-delay 0.3
        company-minimum-prefix-length 2
        company-tooltip-limit 20
        ;; invert the navigation direction if the the completion popup-isearch-match
        ;; is displayed on top (happens near the bottom of windows)
        company-tooltip-flip-when-above t)

  (global-company-mode 1)

  ;; Customize keybindings for navigating up/down the completion popup list.
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)

  ;; Enable indent and complete at point functionality by pressing tab.
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common))

(provide 'siren-company)
;;; siren-company.el ends here
