;;; siren-terraform.el --- jimeh's Emacs Siren: terraform-mode configuration.

;;; Commentary:

;; Basic configuration for terraform-mode.

;;; Code:

(require 'siren-lsp)
(require 'siren-reformatter)

(use-package terraform-mode
  :hook
  (terraform-mode . siren-terraform-mode-setup)

  :custom
  (terraform-indent-level 2)

  :preface
  (defun siren-terraform-mode-setup ()
    (setq-local tab-width 2)
    (terraform-format-on-save-mode 1))

  :config
  ;; This does a better job of injecting formatted content than the default
  ;; formatting commands included with terraform-mode.
  (reformatter-define terraform-format
    :program "terraform"
    :args '("fmt" "-no-color" "-")
    :lighter " fmt"))

(use-package terraform-doc
  :defer t)

(provide 'siren-terraform)
;;; siren-terraform.el ends here
