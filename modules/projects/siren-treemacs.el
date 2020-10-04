;;; siren-treemacs.el --- jimeh's Emacs Siren: treemacs configuration.

;;; Commentary:

;; Basic configuration for treemacs.

;;; Code:

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

  (treemacs-persist-file (expand-file-name "treemacs-persist" siren-cache-dir))
  (treemacs-last-error-persist-file
   (expand-file-name "treemacs-persist-at-last-error" siren-cache-dir))

  :config
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

(use-package treemacs-all-the-icons
  :defer t
  :after (treemacs))

(use-package treemacs-projectile
  :defer t
  :after (treemacs projectile)
  :custom
  (treemacs-header-function #'treemacs-projectile-create-header))

(use-package treemacs-magit
  :defer t
  :after (treemacs magit))

(use-package lsp-treemacs
  :defer t
  :after (treemacs lsp-mode)

  :custom
  (lsp-metals-treeview-show-when-views-received t)

  :config
  (lsp-treemacs-sync-mode 1))

(provide 'siren-treemacs)
;;; siren-treemacs.el ends here
