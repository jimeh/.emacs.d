;;; siren-magit.el --- jimeh's Emacs Siren: magit configuration.

;;; Commentary:

;; Basic configuration for magit.

;;; Code:

(require 'siren-display-fill-column)
(require 'siren-display-line-numbers)
(require 'siren-flyspell)

(use-package magit
  :demand
  :bind
  ("C-x g". magit-status)

  :hook
  (siren-magit-mode . siren-magit-mode-setup)
  (git-commit-setup . siren-git-commit-mode-setup)

  :custom
  (magit-bury-buffer-function 'magit-mode-quit-window)
  (magit-commit-arguments '("-S"))
  (magit-completing-read-function 'magit-ido-completing-read)
  (magit-default-tracking-name-function
   'magit-default-tracking-name-branch-only)
  (magit-diff-refine-hunk t)
  (magit-display-buffer-function
   'magit-display-buffer-same-window-except-diff-v1)
  (magit-repository-directories '(("~/Projects" . 2)
                                  ("~/src" . 1)
                                  ("~/.emacs.d" . 0)
                                  ("~/.dotfiles" . 2)))
  (magit-restore-window-configuration nil)
  (magit-revert-buffers 'silent)
  (magit-status-buffer-switch-function 'switch-to-buffer)

  :init
  (defalias 'bl 'magit-blame)

  (defun siren-magit-mode-setup ())

  (defun siren-git-commit-mode-setup ()
    (setq tab-width 2
          fill-column 72)

    (siren-display-fill-column)
    (siren-display-line-numbers)
    (subword-mode)
    (flyspell-mode)
    (auto-fill-mode))

  :config
  (require 'magit))

(use-package transient
  :defer t
  :custom
  (transient-history-file
   (expand-file-name "transient/history.el" siren-cache-dir))
  (transient-levels-file
   (expand-file-name "transient/levels.el" siren-cache-dir))
  (transient-values-file
   (expand-file-name "transient/values.el" siren-cache-dir)))

(provide 'siren-magit)
;;; siren-magit.el ends here
