;;; siren-imenu.el --- jimeh's Emacs Siren: imenu configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for imenu.

;;; Code:

(use-package imenu
  :ensure nil
  :defer t

  :custom
  (imenu-auto-rescan t)
  (imenu-max-item-length 160)
  (imenu-max-items 400))

(use-package imenu-anywhere
  :general
  ("C-c t" 'helm-imenu-anywhere))

(provide 'siren-imenu)
;;; siren-imenu.el ends here
