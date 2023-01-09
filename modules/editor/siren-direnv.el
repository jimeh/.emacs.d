;;; siren-direnv.el --- jimeh's Emacs Siren: direnv configuration.

;;; Commentary:

;; Basic configuration for direnv.

;;; Code:

(use-package direnv
  :config
  (when (executable-find "direnv")
    (direnv-mode)))

(provide 'siren-direnv)
;;; siren-direnv.el ends here
