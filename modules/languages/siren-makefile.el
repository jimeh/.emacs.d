;;; siren-makefile.el --- jimeh's Emacs Siren: makefile-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for makefile-mode.

;;; Code:

(require 'siren-display-indentation)
(require 'siren-makefile-executor)

(use-package make-mode
  :ensure nil
  :hook
  (makefile-mode . siren-makefile-mode-setup)

  :general
  (:keymaps 'makefile-mode-map
            "C-c C-m" 'makefile-executor-execute-project-target)

  :preface
  (defun siren-makefile-mode-setup ()
    (siren-display-indentation -1)
    (setq-local tab-width 4)))

(provide 'siren-makefile)
;;; siren-makefile.el ends here
