;;; siren-yaml.el --- jimeh's Emacs Siren: yaml-mode configuration.

;;; Commentary:

;; Basic configuration for yaml-mode.

;;; Code:

(require 'siren-prog-mode)
(require 'siren-prettier-js)

(use-package yaml-mode
  :mode "\\.yml\\'" "\\.yaml\\'"
  :bind (:map yaml-mode-map
              ("RET" . newline-and-indent))

  :hook
  (yaml-mode . siren-yaml-mode-setup)

  :init
  (defun siren-yaml-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (prettier-js-mode)
    (setq tab-width 2)
    (subword-mode +1)))

(use-package yaml-imenu
  :config
  (yaml-imenu-enable))

(provide 'siren-yaml)
;;; siren-yaml.el ends here
