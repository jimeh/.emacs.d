;;; siren-caddyfile.el --- jimeh's Emacs Siren: caddyfile-mode configuration.

;;; Commentary:

;; Basic configuration for caddyfile-mode.

;;; Code:

(use-package caddyfile-mode
  :mode
  ("Caddyfile\\'" . caddyfile-mode)
  ("caddy\\.conf\\'" . caddyfile-mode)
  ("\\.caddy\\'" . caddyfile-mode)

  :hook
  (caddyfile-mode . siren-caddyfile-mode-setup)

  :init
  (defun siren-caddyfile-mode-setup ()
    (setq-local tab-width 4
                indent-tabs-mode nil)))

(provide 'siren-caddyfile)
;;; siren-caddyfile.el ends here
