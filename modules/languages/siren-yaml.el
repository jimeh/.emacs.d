;;; siren-yaml.el --- jimeh's Emacs Siren: yaml-mode configuration.

;;; Commentary:

;; Basic configuration for yaml-mode.

;;; Code:

(require 'siren-lsp)
(require 'siren-prog-mode)

(defun siren-yaml-is-github-actions-workflow-p ()
  "Return non-nil if current buffer is a GitHub Actions workflow.

This is determined by checking if the buffer is visiting a *.yml
or *.yaml file in a .github/workflows/ directory."
  (and (buffer-file-name)
       (string-match-p "\\.github/workflows/$"
                       (file-name-directory (buffer-file-name)))
       (string-match-p "\\.ya?ml$" (buffer-file-name))))

(defun siren-flycheck-setup-yaml-actionlint()
  (with-eval-after-load 'flycheck
    (flycheck-def-executable-var yaml-actionlint "actionlint")
    (flycheck-define-checker yaml-actionlint
      "A GitHub Actions workflow checker using actionlint."
      :command ("actionlint" "-oneline" "-")
      :standard-input t
      :error-patterns
      ((error
        line-start "<stdin>:" line ":" column ": " (message) line-end)
       (error
        line-start (file-name) ":" line ":" column ": " (message) line-end))
      :predicate siren-yaml-is-github-actions-workflow-p
      :modes (yaml-mode yaml-ts-mode))
    (add-to-list 'flycheck-checkers 'yaml-actionlint)))

(use-package yaml-mode
  :mode "\\.yml\\'" "\\.yaml\\'"
  :general
  (:keyamps 'yaml-mode-map
            "RET" 'newline-and-indent)

  :hook
  (yaml-mode . siren-yaml-mode-setup)

  :preface
  (defun siren-yaml-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq-local tab-width 2))

  :config
  (siren-flycheck-setup-yaml-actionlint))

(use-package lsp-yaml
  :straight lsp-mode

  :hook
  (yaml-mode . siren-lsp-yaml-mode-setup)

  :preface
  (defun siren-lsp-yaml-mode-setup ()
    (lsp)
    (lsp-format-buffer-on-save-mode)
    (when (and (fboundp 'flycheck-select-checker)
               (siren-yaml-is-github-actions-workflow-p)
               (executable-find "actionlint"))
      (flycheck-select-checker 'yaml-actionlint)
      (flycheck-add-next-checker 'yaml-actionlint 'lsp))))

(use-package yaml-imenu
  :after yaml-mode
  :config
  (yaml-imenu-enable))

(use-package yaml-ts-mode
  :straight (:type built-in)
  :after yaml-mode
  :if (fboundp 'yaml-ts-mode)
  :hook (yaml-ts-mode . siren-yaml-ts-mode-setup)

  :preface
  (defun siren-yaml-ts-mode-setup ()
    (run-hooks 'yaml-mode-hook)))

(provide 'siren-yaml)
;;; siren-yaml.el ends here
