;;; siren-company.el --- jimeh's Emacs Siren: company configuration.

;;; Commentary:

;; Basic configuration for company. Auto completion on steroids.

;;; Code:

(use-package company
  :general
  ;; Enable indent and complete at point functionality by pressing tab.
  ("TAB" 'company-indent-or-complete-common)
  ;; Scroll through company suggestions with C-n and C-p.
  (:keymaps 'company-active-map
            "C-n" 'company-select-next
            "C-p" 'company-select-previous
            "<tab>" 'company-complete-selection)

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

  :hook
  (lsp-completion-mode . siren-company-lsp-mode-setup)

  :preface
  (defun siren-company-lsp-mode-setup ()
    (setq-local company-backends '(company-capf)))

  :config
  (global-company-mode 1))

(use-package company-box
  :if window-system
  :hook (company-mode . company-box-mode))

(provide 'siren-company)
;;; siren-company.el ends here
