;;; siren-edit-server.el --- jimeh's Emacs Siren: edit-server configuration.

;;; Commentary:

;; Basic configuration for edit-server.

;;; Code:

(siren-require-packages '(edit-server))

(require 'edit-server)

(setq edit-server-default-major-mode 'markdown-mode)
(setq edit-server-new-frame-alist
  '((name . "Edit with Emacs FRAME")
    (width . 90)
    (height . 45)
    (minibuffer . t)
    (menu-bar-lines . t)))

(if window-system
    (edit-server-start))

(provide 'siren-edit-server)
;;; siren-edit-server.el ends here
