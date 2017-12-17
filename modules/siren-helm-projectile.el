;;; siren-helm-projectile.el --- jimeh's Emacs Siren: helm-projectile configuration.

;;; Commentary:

;; Basic configuration for helm-projectile.

;;; Code:

(require 'siren-helm)

(use-package helm-projectile
  :bind
  ("C-x ;" . helm-projectile)
  ("C-x C-;" . helm-projectile)
  ("C-c ;" . helm-projectile-switch-project)
  ("C-c C-;" . helm-projectile-switch-project))

(provide 'siren-helm-projectile)
;;; siren-helm-projectile.el ends here
