;;; siren-gitconfig.el --- jimeh's Emacs Siren: gitconfig-mode configuration.

;;; Commentary:

;; Basic configuration for gitconfig-mode.

;;; Code:

(require 'siren-programming)

(use-package gitconfig-mode
  :mode "\\.gitconfig" "gitconfig\\'" "\\.git\\\/config"

  :config
  (defun siren-gitconfig-mode-defaults ()
    (siren-prog-mode-defaults)
    (setq tab-width 2)
    (highlight-indentation-current-column-mode)
    (run-hooks 'siren-prog-mode-hook))

  (setq siren-gitconfig-mode-hook 'siren-gitconfig-mode-defaults)
  (add-hook 'gitconfig-mode-hook (lambda ()
                             (run-hooks 'siren-gitconfig-mode-hook))))

(provide 'siren-gitconfig)
;;; siren-gitconfig.el ends here
