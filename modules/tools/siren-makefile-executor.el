;;; siren-makefile-executor.el --- jimeh's Emacs Siren: makefile-executor configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for makefile-executor.

;;; Code:

(require 'siren-helm-make)

(use-package makefile-executor
  :hook
  (makefile-mode . makefile-executor-mode)

  :general
  ("C-c C-m" 'makefile-executor-execute-project-target)

  :config
  ;; Replace get targets function with that from helm-make as it faster and more
  ;; efficient by not needing to write any temporary files to disk.
  (require 'helm-make)
  (defalias 'makefile-executor-get-targets 'helm--make-target-list-qp))

(provide 'siren-makefile-executor)
;;; siren-makefile-executor.el ends here
