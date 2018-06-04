;;; siren-dired-sidebar.el --- jimeh's Emacs Siren: dired-sidebar configuration.

;;; Commentary:

;; Basic configuration for dired-sidebar.

;;; Code:

(use-package dired-sidebar
  :commands dired-sidebar-toggle-sidebar

  :bind
  ("C-x C-p" . dired-sidebar-toggle-sidebar)

  :config
  (setq dired-sidebar-subtree-line-prefix " .")
  (cond
   ((eq system-type 'darwin)
    (if (display-graphic-p)
        (setq dired-sidebar-theme 'icons)
      (setq dired-sidebar-theme 'nerd)))
   (:default
    (setq dired-sidebar-theme 'nerd)))
  (setq dired-sidebar-use-term-integration t))

(use-package all-the-icons-dired
  :requires dired-sidebar
  :commands (all-the-icons-dired-mode))

(provide 'siren-dired-sidebar)
;;; siren-dired-sidebar.el ends here
