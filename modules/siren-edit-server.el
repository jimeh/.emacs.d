;;; siren-edit-server.el --- jimeh's Emacs Siren: edit-server configuration.

;;; Commentary:

;; Basic configuration for edit-server.

;;; Code:

(use-package edit-server
  :if window-system
  :init
  (setq edit-server-default-major-mode 'markdown-mode)
  (setq edit-server-new-frame-alist
        '((name . "Edit with Emacs FRAME")
          (width . 90)
          (height . 45)
          (minibuffer . t)
          (menu-bar-lines . t)))

  (add-hook 'after-init-hook 'edit-server-start t))

(provide 'siren-edit-server)
;;; siren-edit-server.el ends here
