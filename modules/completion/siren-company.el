;;; siren-company.el --- jimeh's Emacs Siren: company configuration.

;;; Commentary:

;; Basic configuration for company. Auto completion on steroids.

;;; Code:

(use-package company
  :bind
  ;; Enable indent and complete at point functionality by pressing tab.
  ("TAB" . company-indent-or-complete-common)
  ;; Scroll through company suggestions with C-n and C-p.
  (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
              ("<tab>" . company-complete-selection))

  :custom
  (company-begin-commands '(self-insert-command))
  (company-dabbrev-downcase nil)
  (company-echo-delay 0.01)
  (company-idle-delay 0.2)
  (company-minimum-prefix-length 2)
  (company-tooltip-limit 20)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (company-tooltip-flip-when-above t)

  :config
  (defvar-local siren-company--fci-mode-on-p nil)
  (global-company-mode 1)

  (with-eval-after-load 'fill-column-indicator
    (defun siren-company--turn-off-fci (&rest ignore)
      (when (boundp 'fci-mode)
        (when fci-mode
          (turn-off-fci-mode)
          (setq siren-company--fci-mode-on-p t))))

    (defun siren-company--maybe-turn-on-fci (&rest ignore)
      (when siren-company--fci-mode-on-p
        (turn-on-fci-mode)
        (setq siren-company--fci-mode-on-p nil)))

    (add-hook 'company-completion-started-hook
              #'siren-company--turn-off-fci)
    (add-hook 'company-completion-finished-hook
              #'siren-company--maybe-turn-on-fci)
    (add-hook 'company-completion-cancelled-hook
              #'siren-company--maybe-turn-on-fci)))

(provide 'siren-company)
;;; siren-company.el ends here
