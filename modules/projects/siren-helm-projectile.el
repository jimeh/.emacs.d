;;; siren-helm-projectile.el --- jimeh's Emacs Siren: helm-projectile configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for helm-projectile.

;;; Code:

(require 'siren-helm)
(require 'siren-projectile)

(use-package helm-projectile
  :after (helm-global-bindings)
  :general
  ("C-x ;" 'helm-projectile-find-file)
  ("C-x C-;" 'helm-projectile-find-file)
  ("C-c ;" 'helm-projectile-switch-project)
  ("C-c C-;" 'helm-projectile-switch-project))

(provide 'siren-helm-projectile)
;;; siren-helm-projectile.el ends here
