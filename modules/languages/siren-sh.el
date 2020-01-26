;;; siren-sh.el --- jimeh's Emacs Siren: sh-mode configuration.

;;; Commentary:

;; Basic configuration for sh-mode.

;;; Code:

(use-package sh-script
  :ensure nil ;; loaded from emacs built-ins
  :mode
  "\\.tmux"
  "\\.tmuxsh"
  "\\.tmuxtheme"
  :hook
  (sh-mode . siren-sh-mode-setup)

  :init
  (defun siren-sh-mode-setup ()
    (setq tab-width 2
          sh-basic-offset 2
          sh-indentation 2
          whitespace-action '(auto-cleanup))

    (subword-mode +1)
    (define-key sh-mode-map (kbd "RET") 'newline-and-indent)))

(provide 'siren-sh)
;;; siren-sh.el ends here
