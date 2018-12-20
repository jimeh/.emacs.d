;;; siren-company.el --- jimeh's Emacs Siren: company configuration.

;;; Commentary:

;; Basic configuration for company. Auto completion on steroids.

;;; Code:

;; (require 'siren-fci)

(use-package company
  :hook
  (company-completion-started . siren-company--turn-off-fci)
  (company-completion-finished . siren-company--maybe-turn-on-fci)
  (company-completion-cancelled . siren-company--maybe-turn-on-fci)

  :init
  (defun siren-company--turn-off-fci (&rest ignore)
    (when (boundp 'fci-mode)
      (when fci-mode
        (turn-off-fci-mode)
        (setq siren-company--fci-mode-on-p t))))

  (defun siren-company--maybe-turn-on-fci (&rest ignore)
    (when siren-company--fci-mode-on-p
      (turn-on-fci-mode)
      (setq siren-company--fci-mode-on-p nil)))

  :config
  (defvar-local siren-company--fci-mode-on-p nil)

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
