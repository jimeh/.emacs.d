;;; siren-magit.el --- jimeh's Emacs Siren: magit configuration.

;;; Commentary:

;; Basic configuration for magit.

;;; Code:

(use-package magit
  :bind
  ("C-x g". magit-status)
  ("C-x C-g". magit-status)

  :init
  (defalias 'bl 'magit-blame)

  :config
  (require 'siren-fci)
  (require 'siren-flyspell)
  (require 'siren-ediff)
  (require 'magit)

  (setq magit-completing-read-function 'magit-ido-completing-read
        magit-status-buffer-switch-function 'switch-to-buffer
        magit-bury-buffer-function 'bury-buffer
        magit-restore-window-configuration nil
        magit-revert-buffers 'silent
        magit-default-tracking-name-function 'magit-default-tracking-name-branch-only
        magit-repository-directories '("~/Projects" "~/src" "~/.emacs.d" "~/.dotfiles")
        magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)

  (defun siren-magit-mode-defaults ())
  (setq siren-magit-mode-hook 'siren-magit-mode-defaults)
  (add-hook 'magit-mode-hook (lambda () (run-hooks 'siren-magit-mode-hook)))

  (defun siren-git-commit-mode-defaults ()
    (subword-mode)
    (setq tab-width 2)
    ;; (flyspell-mode) ;; in GUI causes git-commit-mode to lock up emacs
    (linum-mode t)
    (auto-fill-mode))

  (setq siren-git-commit-mode-hook 'siren-git-commit-mode-defaults)
  (add-hook 'git-commit-mode-hook (lambda ()
                                    (run-hooks 'siren-git-commit-mode-hook))))

(provide 'siren-magit)
;;; siren-magit.el ends here
