;;; siren-edit-server.el --- jimeh's Emacs Siren: edit-server configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for edit-server.

;;; Code:

(use-package edit-server
  :if window-system

  :custom
  (edit-server-default-major-mode 'markdown-mode)
  (edit-server-new-frame-alist
   '((name . "Edit with Emacs FRAME")
     (width . 90)
     (height . 45)
     (minibuffer . t)
     (menu-bar-lines . t)))

  :config
  (edit-server-start))

(provide 'siren-edit-server)
;;; siren-edit-server.el ends here
