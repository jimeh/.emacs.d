;;; siren-magithub.el --- jimeh's Emacs Siren: magithub configuration

;;; Commentary:

;; Basic configuration for magithub.

;;; Code:

(require 'siren-magit)

(use-package magithub
  :after magit

  :custom
  (magithub-clone-default-directory "~/Projects")

  :config
  (magithub-feature-autoinject t))

(provide 'siren-magithub)
;;; siren-magithub.el ends here
