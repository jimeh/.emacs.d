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
  (git-commit-setup . siren-git-commit-mode-setup)

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

  (setq magit-bury-buffer-function 'magit-mode-quit-window
        magit-completing-read-function 'magit-ido-completing-read
        magit-commit-arguments '("-S")
        magit-default-tracking-name-function 'magit-default-tracking-name-branch-only
        magit-diff-refine-hunk t
        magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1
        magit-restore-window-configuration nil
        magit-revert-buffers 'silent
        magit-repository-directories '(("~/Projects" . 2)
                                       ("~/src" . 1)
                                       ("~/.emacs.d" . 0)
                                       ("~/.dotfiles" . 2))
        magit-status-buffer-switch-function 'switch-to-buffer))

(use-package transient
  :defer t
  :config
  (setq transient-history-file (expand-file-name "transient/history.el" siren-cache-dir)
        transient-levels-file (expand-file-name "transient/levels.el" siren-cache-dir)
        transient-values-file (expand-file-name "transient/values.el" siren-cache-dir)))

(provide 'siren-magit)
;;; siren-magit.el ends here
