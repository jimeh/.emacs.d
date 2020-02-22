;;; siren-conf.el --- jimeh's Emacs Siren: conf-mode configuration.

;;; Commentary:

;; Basic configuration for conf-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package conf-mode
  :mode
  "/Procfile\\'"
  "/\\.env\\'"
  "/\\.env\\.[^/]+\\'"
  "\\.cfg\\'"
  "\\.conf\\'"

  :hook (conf-mode . siren-conf-mode-setup)

  :init
  (defun siren-conf-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq tab-width 2)))

(provide 'siren-conf)
;;; siren-conf.el ends here
