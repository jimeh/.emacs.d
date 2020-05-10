;;; siren-imenu.el --- jimeh's Emacs Siren: imenu configuration.

;;; Commentary:

;; Basic configuration for imenu.

;;; Code:

(require 'imenu)
(require 'siren-helm)

(use-package imenu-anywhere
  :bind
  ("C-c t" . helm-imenu-anywhere)

  :config
  (set-default 'imenu-auto-rescan t)
  (set-default 'imenu-max-item-length 160)
  (set-default 'imenu-max-items 400))

(provide 'siren-imenu)
;;; siren-imenu.el ends here
