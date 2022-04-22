;;; siren-nginx.el --- jimeh's Emacs Siren: nginx-mode configuration.

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
    (setq tab-width 4)))

(use-package company-nginx
  :hook
  (nginx-mode . company-nginx-keywords))

(provide 'siren-nginx)
;;; siren-nginx.el ends here
