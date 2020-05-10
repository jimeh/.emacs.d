;;; siren-treemacs.el --- jimeh's Emacs Siren: treemacs configuration.

;;; Commentary:

;; Basic configuration for treemacs.

;;; Code:

(require 'siren-lsp)
(require 'siren-magit)
(require 'siren-persp-mode)
(require 'siren-projectile)

(use-package treemacs
  :bind
  ("C-x C-p" . treemacs)
  ("C-x p" . treemacs-select-window)

  :custom
  (treemacs-collapse-dirs 3)
  (treemacs-follow-after-init t)
  (treemacs-goto-tag-strategy 'refetch-index)
  (treemacs-indentation 2)
  (treemacs-is-never-other-window t)
  (treemacs-show-hidden-files t)
  (treemacs-silent-refresh nil)
  (treemacs-sorting 'alphabetic-asc)
  (treemacs-width 40)

  :config
  (with-eval-after-load 'projectile
    (require 'treemacs-projectile))
  (with-eval-after-load 'persp-mode
    (require 'treemacs-persp))
  (with-eval-after-load 'magit
    (require 'treemacs-magit))
  (with-eval-after-load 'lsp-mode
    (require 'lsp-treemacs))

  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'deferred)

  (treemacs-define-doubleclick-action
   'file-node-open   #'treemacs-visit-node-in-most-recently-used-window)
  (treemacs-define-doubleclick-action
   'file-node-closed #'treemacs-visit-node-in-most-recently-used-window)
  (treemacs-define-RET-action
   'file-node-open   #'treemacs-visit-node-in-most-recently-used-window)
  (treemacs-define-RET-action
   'file-node-closed #'treemacs-visit-node-in-most-recently-used-window))

(use-package treemacs-projectile
  :defer t
  :custom
  (treemacs-header-function #'treemacs-projectile-create-header))

(use-package treemacs-persp
  :defer t)

(use-package treemacs-magit
  :defer t)

(use-package lsp-treemacs
  :defer t
  :config
  (lsp-treemacs-sync-mode 1)
  (setq lsp-metals-treeview-show-when-views-received t))

(provide 'siren-treemacs)
;;; siren-treemacs.el ends here
