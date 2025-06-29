;;; siren-haml.el --- jimeh's Emacs Siren: haml-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for haml-mode.

;;; Code:

(use-package haml-mode
  :mode "\\.haml\\'" "\\.hamlc\\'"
  :hook (haml-mode . siren-haml-mode-setup)

  :preface
  (defun siren-haml-mode-setup ()
    (setq-local tab-width 2)))

(provide 'siren-haml)
;;; siren-haml.el ends here
