;;; siren-helm.el --- jimeh's Emacs Siren: helm configuration.

;;; Commentary:

;; Basic configuration for helm.

;;; Code:

(siren-require-packages '(helm helm-ag helm-descbinds helm-describe-modes
                               helm-gtags helm-ls-git helm-open-github
                               helm-projectile helm-swoop))

(require 'helm)
(require 'helm-ag)
(require 'helm-describe-modes)
(require 'helm-gtags)
(require 'helm-ls-git)
(require 'helm-open-github)
(require 'helm-projectile)
(require 'helm-swoop)
(require 'helm-descbinds)

(setq helm-ag-ignore-patterns '("*.sql")
      helm-ag-source-type "file-line"
      helm-autoresize-mode 1
      helm-gtags-auto-update t
      helm-gtags-direct-helm-completing t
      helm-gtags-fuzzy-match t
      helm-gtags-ignore-case t
      helm-open-github-commit-limit 10000)

;; Helm
(define-key helm-map (kbd "<up>") 'previous-history-element)
(define-key helm-map (kbd "<down>") 'next-history-element)
(define-key helm-map (kbd "M-p") 'helm-previous-source)
(define-key helm-map (kbd "M-n") 'helm-next-source)
(global-set-key (kbd "C-c h") 'helm-mini)

;; Helm Swoop
(global-set-key (kbd "M-r") 'helm-swoop-without-pre-input)
(global-set-key (kbd "M-R") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-r") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-r") 'helm-multi-swoop-all)

;; Helm ag
(global-set-key (kbd "C-c C-s") 'helm-do-ag)
(global-set-key (kbd "C-c C-'") 'helm-do-ag-project-root)

;; Helm Projectile
(global-set-key (kbd "C-c ;") 'helm-projectile)
(global-set-key (kbd "C-c C-;") 'helm-projectile)

;; Helm Open Github
(global-set-key (kbd "C-c o f") 'helm-open-github-from-file)
(global-set-key (kbd "C-c o c") 'helm-open-github-from-commit)
(global-set-key (kbd "C-c o i") 'helm-open-github-from-issues)
(global-set-key (kbd "C-c o p") 'helm-open-github-from-pull-requests)

(provide 'siren-helm)
;;; siren-helm.el ends here
