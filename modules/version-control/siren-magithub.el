;;; siren-magithub.el --- jimeh's Emacs Siren: magithub configuration

;;; Commentary:

;; Basic configuration for magithub.

;;; Code:

(require 'siren-magit)

(use-package magithub
  :after magit
  :config
  (magithub-feature-autoinject t)
  (setq magithub-clone-default-directory "~/Projects"))

(provide 'siren-magithub)
;;; siren-magithub.el ends here
