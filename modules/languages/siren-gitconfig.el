;;; siren-gitconfig.el --- jimeh's Emacs Siren: gitconfig-mode configuration.

;;; Commentary:

;; Basic configuration for gitconfig-mode.

;;; Code:

(use-package gitconfig-mode
  :mode "\\.gitconfig" "gitconfig\\'" "\\.git\\\/config"
  :hook (gitconfig-mode . siren-gitconfig-mode-setup)

  :init
  (defun siren-gitconfig-mode-setup ()))

(provide 'siren-gitconfig)
;;; siren-gitconfig.el ends here
