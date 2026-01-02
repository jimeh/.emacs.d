;;; siren-terraform.el --- jimeh's Emacs Siren: terraform-mode configuration.  -*- lexical-binding: nil; -*-

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
    (setq-local tab-width 2))

  :config
  ;; This does a better job of injecting formatted content than the default
  ;; formatting commands included with terraform-mode.
  (reformatter-define terraform-format
    :program "terraform"
    :args '("fmt" "-no-color" "-")
    :lighter " fmt"))

(use-package lsp-terraform
  :ensure nil
  :defer t
  :hook
  (terraform-mode . siren-lsp-terraform-mode-setup)

  :preface
  (defun siren-lsp-terraform-mode-setup ()
    ;; Disable semantic tokens as it typically causes an annoying delay with the
    ;; syntax highlighting as you type. Essentially all new text is a very faded
    ;; out grey color for the first 1-2 seconds as you type.
    (setq-local lsp-semantic-tokens-enable nil)

    (lsp-format-buffer-on-save-mode t)
    (lsp-deferred)))

(use-package terraform-doc
  :defer t)

(provide 'siren-terraform)
;;; siren-terraform.el ends here
