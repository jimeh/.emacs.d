;;; siren-conf.el --- jimeh's Emacs Siren: conf-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for conf-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package conf-mode
  :ensure nil
  :mode
  "/Procfile\\'"
  "/\\.env\\'"
  "/\\.env\\.[^/]+\\'"
  "\\.cfg\\'"
  "\\.conf\\'"
  "\\tool-versions\\'"
  "\\.tool-versions\\'"

  :hook (conf-mode . siren-conf-mode-setup)

  :preface
  (defun siren-conf-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq-local tab-width 2)))

(provide 'siren-conf)
;;; siren-conf.el ends here
