;;; siren-yaml.el --- jimeh's Emacs Siren: yaml-mode configuration.

;;; Commentary:

;; Basic configuration for yaml-mode.

;;; Code:

(require 'siren-display-indentation)
(require 'siren-fci)
(require 'siren-flyspell)
(require 'siren-linum)
(require 'siren-prog-mode)
(require 'siren-smartparens)

(use-package yaml-mode
  :mode "\\.yml\\'" "\\.yaml\\'"
  :bind (:map yaml-mode-map
              ("RET" . newline-and-indent))

  :hook
  (yaml-mode . siren-yaml-mode-setup)

  :init
  (defun siren-yaml-mode-setup ()
    (siren-prog-mode-setup)
    (setq tab-width 2
          whitespace-action '(auto-cleanup))

    (siren-display-indentation)
    (fci-mode)
    (flyspell-mode)
    (linum-mode t)
    (smartparens-mode +1)
    (subword-mode +1)))

(use-package yaml-imenu
  :config
  (yaml-imenu-enable))

(provide 'siren-yaml)
;;; siren-yaml.el ends here
