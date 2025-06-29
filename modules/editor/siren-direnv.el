;;; siren-direnv.el --- jimeh's Emacs Siren: direnv configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for direnv.

;;; Code:

(use-package direnv
  :config
  (when (executable-find "direnv")
    (direnv-mode)))

(provide 'siren-direnv)
;;; siren-direnv.el ends here
