;;; siren-magit-todos.el --- jimeh's Emacs Siren: magit-todos configuration  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for magit-todos.

;;; Code:

(require 'siren-magit)

(use-package magit-todos
  :after magit

  :config
  (magit-todos-mode))

(provide 'siren-magit-todos)
;;; siren-magit-todos.el ends here
