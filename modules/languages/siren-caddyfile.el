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

  :preface
  (defun siren-caddyfile-mode-setup ()
    (setq-local tab-width 4
                indent-tabs-mode nil)

    ;; TODO: Fix this horrible Hock. To work around prog-mode hooks running
    ;; before current method, enabling whitespace-mode before the local
    ;; indent-tabs-mode var is set to nil. Hence we need to toggle
    ;; whitespace-mode off, and then on again to fix it's complaints about a
    ;; space indentation.
    (whitespace-mode -1)
    (whitespace-mode +1)))

(provide 'siren-caddyfile)
;;; siren-caddyfile.el ends here
