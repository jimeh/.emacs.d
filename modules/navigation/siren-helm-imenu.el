;;; siren-helm-imenu.el --- jimeh's Emacs Siren: helm-imenu configuration.

;;; Commentary:

;; Basic configuration for helm-imenu.

;;; Code:

(require 'imenu)
(require 'siren-helm)

(use-package imenu-anywhere
  :config
  (set-default 'imenu-auto-rescan t)
  (set-default 'imenu-max-item-length 160)
  (set-default 'imenu-max-items 400))

(use-package helm-imenu
  :ensure helm
  :bind
  ("C-t" . helm-imenu)
  ("C-c t" . helm-imenu-anywhere))

(provide 'siren-helm-imenu)
;;; siren-helm-imenu.el ends here
