;;; siren-gitconfig.el --- jimeh's Emacs Siren: gitconfig-mode configuration.

;;; Commentary:

;; Basic configuration for gitconfig-mode.

;;; Code:

(require 'siren-programming)

(use-package gitconfig-mode
  :mode "\\.gitconfig" "gitconfig\\'" "\\.git\\\/config"
  :hook (gitconfig-mode . siren-gitconfig-mode-setup)

  :init
  (defun siren-gitconfig-mode-setup ()
    (siren-prog-mode-setup)
    (setq tab-width 2)
    (highlight-indentation-current-column-mode)
    (run-hooks 'siren-prog-mode-hook)))

(provide 'siren-gitconfig)
;;; siren-gitconfig.el ends here
