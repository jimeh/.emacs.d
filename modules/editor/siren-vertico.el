;;; siren-vertico.el --- jimeh's Emacs Siren: vertico configuration.

;;; Commentary:

;; Basic configuration for vertico.

;;; Code:

(use-package vertico
  :custom
  (vertico-count 16)
  (vertico-cycle t)
  (vertico-resize nil)

  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)

  :init
  (defun siren-crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))

  :config
  (vertico-mode +1)
  (advice-add #'completing-read-multiple :filter-args #'siren-crm-indicator))

(use-package vertico-extensions
  :straight (:type git :host github :repo "emacs-straight/vertico"
                   :files ("extensions/*.el"))
  :after vertico
  :ensure nil
  :bind
  ("C-c C-v" . vertico-restore))

(provide 'siren-vertico)
;;; siren-vertico.el ends here
