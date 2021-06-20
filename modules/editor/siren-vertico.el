;;; siren-vertico.el --- jimeh's Emacs Siren: vertico configuration.

;;; Commentary:

;; Basic configuration for vertico.

;;; Code:

(require 'siren-orderless)

(use-package vertico
  :custom
  (enable-recursive-minibuffers t)
  (resize-mini-windows nil)
  (vertico-count 12)
  (vertico-cycle t)

  :init
  (defun siren-crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))

  :config
  (vertico-mode +1)
  (advice-add #'completing-read-multiple :filter-args #'siren-crm-indicator))

(provide 'siren-vertico)
;;; siren-vertico.el ends here
