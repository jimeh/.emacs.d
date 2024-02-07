;;; siren-magit.el --- jimeh's Emacs Siren: magit configuration.

;;; Commentary:

;; Basic configuration for magit.

;;; Code:

(require 'siren-display-fill-column)
(require 'siren-display-line-numbers)
(require 'siren-whitespace)

(use-package magit
  :general
  ("C-x g" 'magit-status)

  :hook
  (magit-mode . siren-magit-mode-setup)
  (magit-status-mode . siren-magit-common-setup)
  (magit-diff-mode . siren-magit-common-setup)
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

  :preface
  (defalias 'bl 'magit-blame)

  (defun siren-magit-common-setup ()
    (setq tab-width 4))

  (defun siren-magit-mode-setup ())

  (defun siren-git-commit-mode-setup ()
    (setq tab-width 4
          fill-column 72)

    (siren-display-fill-column)
    (siren-display-line-numbers)
    (auto-fill-mode t)
    (whitespace-mode t))

  :config
  (when (fboundp 'system-move-file-to-trash)
    (setq magit-delete-by-moving-to-trash t)))

(use-package transient
  :defer t
  :custom
  (transient-history-file (siren-cache-dir "transient/history.el"))
  (transient-levels-file (siren-cache-dir "transient/levels.el"))
  (transient-values-file (siren-cache-dir "transient/values.el")))

(use-package magit-delta
  :hook
  (magit-mode . siren-setup-magit-delta)

  :custom
  (magit-delta-default-dark-theme "OneHalfDark")
  (magit-delta-default-light-theme "OneHalfLight")
  (siren-magit-delta-enabled nil)

  :preface
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

(use-package conventional-commit
  :straight (:host github :repo "akirak/conventional-commit.el")
  :hook
  (git-commit-mode . conventional-commit-setup))

(provide 'siren-magit)
;;; siren-magit.el ends here
