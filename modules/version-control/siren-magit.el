;;; siren-magit.el --- jimeh's Emacs Siren: magit configuration.

;;; Commentary:

;; Basic configuration for magit.

;;; Code:

(require 'siren-display-fill-column)
(require 'siren-display-line-numbers)
(require 'siren-flyspell)

(use-package magit
  :bind
  ("C-x g". magit-status)

  :hook
  (siren-magit-mode . siren-magit-mode-setup)
  (git-commit-setup . siren-git-commit-mode-setup)

  :custom
  (magit-bury-buffer-function 'magit-mode-quit-window)
  (magit-commit-arguments '("-S"))
  (magit-completing-read-function 'magit-builtin-completing-read)
  (magit-default-tracking-name-function
   'magit-default-tracking-name-branch-only)
  (magit-diff-adjust-tab-width t)
  (magit-diff-refine-hunk t)
  (magit-display-buffer-function
   'magit-display-buffer-same-window-except-diff-v1)
  (magit-repository-directories '(("~/Projects" . 2)
                                  ("~/src" . 1)
                                  ("~/.emacs.d" . 0)
                                  ("~/.config/emacs-siren" . 0)
                                  ("~/.dotfiles" . 2)))
  (magit-restore-window-configuration nil)
  (magit-revert-buffers 'silent)
  (magit-status-buffer-switch-function 'switch-to-buffer)

  :init
  (defalias 'bl 'magit-blame)

  (defun siren-magit-mode-setup ())

  (defun siren-git-commit-mode-setup ()
    (setq tab-width 4
          fill-column 72)

    (siren-display-fill-column)
    (siren-display-line-numbers)
    (subword-mode)
    (flyspell-mode)
    (auto-fill-mode))

  :config
  (when (fboundp 'system-move-file-to-trash)
    (setq magit-delete-by-moving-to-trash t)))

(use-package transient
  :defer t
  :custom
  (transient-history-file
   (expand-file-name "transient/history.el" siren-cache-dir))
  (transient-levels-file
   (expand-file-name "transient/levels.el" siren-cache-dir))
  (transient-values-file
   (expand-file-name "transient/values.el" siren-cache-dir)))

(use-package magit-delta
  :hook
  (magit-mode . siren-setup-magit-delta)

  :custom
  (magit-delta-default-dark-theme "OneHalfDark")
  (magit-delta-default-light-theme "OneHalfLight")
  (siren-magit-delta-enabled nil)

  :init
  (defgroup siren-magit-delta nil
    "Siren specific options for magit-delta."
    :group 'magit-delta)

  (defcustom siren-magit-delta-enabled t
    "Enable magit-delta-mode when delta executable is available."
    :type 'boolean
    :group 'siren-magit-delta)

  (defun siren-setup-magit-delta ()
    (when siren-magit-delta-enabled
      (let ((delta-bin (executable-find "delta")))
        (when delta-bin
          (magit-delta-mode +1))))))

(provide 'siren-magit)
;;; siren-magit.el ends here
