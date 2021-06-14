;;; siren-yaml.el --- jimeh's Emacs Siren: yaml-mode configuration.

;;; Commentary:

;; Basic configuration for yaml-mode.

;;; Code:

(require 'siren-lsp)
(require 'siren-prog-mode)

(use-package yaml-mode
  :mode "\\.yml\\'" "\\.yaml\\'"
  :bind (:map yaml-mode-map
              ("RET" . newline-and-indent))

  :hook
  (yaml-mode . siren-yaml-mode-setup)

  :init
  (defun siren-yaml-mode-setup ()
    (run-hooks 'prog-mode-hook)

    ;; Configure prettier after local vars are processed, allowing local
    ;; override of fill-column and have prettier respect it.
    (add-hook 'hack-local-variables-hook
              'siren-yaml-mode-setup-prettier nil t)

    (setq tab-width 2)
    (prettier-js-mode)
    (subword-mode +1))

  (defun siren-yaml-mode-setup-prettier ()
    (setq-local prettier-js-args `("--parser" "yaml"
                                   "--print-width" ,(number-to-string fill-column)
                                   "--prose-wrap" "always"))))

(use-package lsp-yaml
  :straight lsp-mode

  :hook
  (yaml-mode . siren-lsp-yaml-mode-setup)

  :init
  (defun siren-lsp-yaml-mode-setup ()
    (lsp-deferred)))

(use-package yaml-imenu
  :after yaml-mode
  :config
  (yaml-imenu-enable))

(provide 'siren-yaml)
;;; siren-yaml.el ends here
