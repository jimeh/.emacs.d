;;; siren-helm.el --- jimeh's Emacs Siren: helm configuration.

;;; Commentary:

;; Basic configuration for helm.

;;; Code:

(use-package helm
  :defer t
  :config
  (setq helm-autoresize-mode 1))

(use-package helm-ag
  :bind
  ("C-c C-s" . helm-do-ag)
  ("C-c C-'" . helm-do-ag-project-root)

  :config
  (setq helm-ag-ignore-patterns '("*.sql")
        helm-ag-source-type "file-line"))

(use-package helm-descbinds
  :defer t)

(use-package helm-describe-modes
  :defer t)

(use-package helm-gtags
  :defer t
  :config
  (setq helm-gtags-auto-update t
        helm-gtags-direct-helm-completing t
        helm-gtags-fuzzy-match t
        helm-gtags-ignore-case t))

(use-package helm-open-github
  :bind
  ("C-c o f" . helm-open-github-from-file)
  ("C-c o c" . helm-open-github-from-commit)
  ("C-c o i" . helm-open-github-from-issues)
  ("C-c o p" . helm-open-github-from-pull-requests)

  :config
  (setq helm-open-github-commit-limit 10000))

(use-package helm-projectile
  :bind
  ("C-c ;" . helm-projectile)
  ("C-c C-;" . helm-projectile))

(use-package helm-swoop
  :bind
  ("M-r" . helm-swoop-without-pre-input)
  ("M-R" . helm-swoop-back-to-last-point)
  ("C-c M-r" . helm-multi-swoop)
  ("C-x M-r" . helm-multi-swoop-all))

(provide 'siren-helm)
;;; siren-helm.el ends here
