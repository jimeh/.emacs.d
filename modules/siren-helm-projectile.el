;;; siren-helm-projectile.el --- jimeh's Emacs Siren: helm-projectile configuration.

;;; Commentary:

;; Basic configuration for helm-projectile.

;;; Code:

(require 'siren-helm)

(use-package helm-projectile
  :bind
  ("C-x ;" . helm-projectile)
  ("C-x C-;" . helm-projectile-find-file)
  ("C-c ;" . helm-projectile-switch-project)
  ("C-c C-;" . helm-projectile-switch-project)

  :config
  ;; Don't bother with using files in open Dired buffer as initial source for
  ;; helm-projectile-find-file, just use the list of files.
  (setq helm-source-projectile-files-and-dired-list
        '(helm-source-projectile-files-list)))

(provide 'siren-helm-projectile)
;;; siren-helm-projectile.el ends here
