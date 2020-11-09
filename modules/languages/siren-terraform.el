;;; siren-terraform.el --- jimeh's Emacs Siren: terraform-mode configuration.

;;; Commentary:

;; Basic configuration for terraform-mode.

;;; Code:

(require 'siren-company)
(require 'siren-reformatter)
(require 'siren-lsp)

(use-package terraform-mode
  :hook
  (terraform-mode . siren-terraform-mode-setup)

  :custom
  (terraform-indent-level 2)

  :init
  (defun siren-terraform-mode-setup ()
    (setq-local tab-width 2)
    (terraform-format-on-save-mode 1))


  :config
  ;; This does a better job of injecting formatted content than the default
  ;; formatting commands included with terraform-mode.
  (reformatter-define terraform-format
    :program "terraform"
    :args '("fmt" "-no-color" "-")
    :lighter " TF")

  ;; When terraform-ls CLI tool is available, setup lsp-mode to use it
  (when (executable-find "terraform-ls")
    (with-eval-after-load 'lsp-mode
      ;; Disable terraform client included with lsp-mode, because it uses
      ;; terraform-lsp which I have not managed to get working.
      (add-to-list 'lsp-disabled-clients 'tfls)

      (lsp-register-client
       (make-lsp-client
        :new-connection (lsp-stdio-connection '("terraform-ls" "serve"))
        :major-modes '(terraform-mode)
        :priority 1
        :server-id 'terraform-ls))

      (add-hook 'terraform-mode-hook #'lsp-deferred))))

(use-package terraform-doc
  :defer t)

(provide 'siren-terraform)
;;; siren-terraform.el ends here
