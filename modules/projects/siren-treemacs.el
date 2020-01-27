;;; siren-treemacs.el --- jimeh's Emacs Siren: treemacs configuration.

;;; Commentary:

;; Basic configuration for treemacs.

;;; Code:

(require 'siren-dired)
(require 'siren-lsp)
(require 'siren-magit)
(require 'siren-persp-mode)
(require 'siren-projectile)

(use-package treemacs
  :demand

  :bind
  ("C-x C-p" . treemacs)
  ("C-x p" . treemacs-select-window)

  :custom
  (treemacs-change-root-without-asking t)
  (treemacs-collapse-dirs 3)
  (treemacs-follow-after-init t)
  (treemacs-git-integration t)
  (treemacs-goto-tag-strategy 'refetch-index)
  (treemacs-indentation 2)
  (treemacs-is-never-other-window nil)
  (treemacs-never-persist nil)
  (treemacs-show-hidden-files t)
  (treemacs-silent-refresh nil)
  (treemacs-sorting 'alphabetic-asc)
  (treemacs-width 40)

  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)

  (treemacs-define-doubleclick-action
   'file-node-open   #'treemacs-visit-node-in-most-recently-used-window)
  (treemacs-define-doubleclick-action
   'file-node-closed #'treemacs-visit-node-in-most-recently-used-window)
  (treemacs-define-RET-action
   'file-node-open   #'treemacs-visit-node-in-most-recently-used-window)
  (treemacs-define-RET-action
   'file-node-closed #'treemacs-visit-node-in-most-recently-used-window))

(use-package treemacs-projectile
  :demand
  :requires (treemacs projectile)
  :custom
  (treemacs-header-function #'treemacs-projectile-create-header))

(use-package treemacs-persp
  :demand
  :requires treemacs persp-mode)

(use-package treemacs-magit
  :demand
  :requires treemacs magit)

(use-package lsp-treemacs
  :config
  (lsp-treemacs-sync-mode 1)
  (setq lsp-metals-treeview-show-when-views-received t))

(provide 'siren-treemacs)
;;; siren-treemacs.el ends here
