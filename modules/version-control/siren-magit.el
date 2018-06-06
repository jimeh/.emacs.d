;;; siren-magit.el --- jimeh's Emacs Siren: magit configuration.

;;; Commentary:

;; Basic configuration for magit.

;;; Code:

(require 'siren-fci)
(require 'siren-flyspell)

(use-package magit
  :bind
  ("C-x g". magit-status)

  :hook
  (siren-magit-mode . siren-magit-mode-setup)
  (git-commit-mode . siren-git-commit-mode-setup)

  :init
  (defalias 'bl 'magit-blame)

  (defun siren-magit-mode-setup ())

  (defun siren-git-commit-mode-setup ()
    (setq tab-width 2
          fill-column 72)

    (subword-mode)
    (fci-mode t)
    (flyspell-mode)
    (linum-mode t)
    (auto-fill-mode))

  :config
  (require 'magit)

  (setq magit-completing-read-function 'magit-ido-completing-read
        magit-status-buffer-switch-function 'switch-to-buffer
        magit-bury-buffer-function 'magit-mode-quit-window
        magit-restore-window-configuration nil
        magit-revert-buffers 'silent
        magit-default-tracking-name-function 'magit-default-tracking-name-branch-only
        magit-repository-directories '("~/Projects" "~/src" "~/.emacs.d" "~/.dotfiles")
        magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1))

(use-package magit-gh-pulls
  :hook (magit-mode . turn-on-magit-gh-pulls)
  :config
  (setq gh-use-local-git-config t))

(provide 'siren-magit)
;;; siren-magit.el ends here
