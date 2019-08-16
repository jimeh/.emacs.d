;;; siren-magit-todos.el --- jimeh's Emacs Siren: magit-todos configuration

;;; Commentary:

;; Basic configuration for magit-todos.

;;; Code:

(require 'siren-magit)

(use-package magit-todos
  :pin melpa-stable
  :after magit

  :config
  (magit-todos-mode))

(provide 'siren-magit-todos)
;;; siren-magit-todos.el ends here
