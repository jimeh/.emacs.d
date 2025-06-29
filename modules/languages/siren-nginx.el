;;; siren-nginx.el --- jimeh's Emacs Siren: nginx-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for nginx-mode.

;;; Code:

(use-package nginx-mode
  :hook
  (nginx-mode . siren-nginx-mode-setup)

  :custom
  (nginx-indent-level 4)
  (nginx-indent-tabs-mode nil)

  :preface
  (defun siren-nginx-mode-setup ()
    (setq-local tab-width 4)))

(provide 'siren-nginx)
;;; siren-nginx.el ends here
