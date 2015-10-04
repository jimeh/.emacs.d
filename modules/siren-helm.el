;;
;; helm
;;

(siren-require-packages '(helm helm-swoop helm-projectile helm-open-github))

(require 'helm)
(require 'helm-swoop)
(require 'helm-projectile)
(require 'helm-open-github)

(setq helm-ag-source-type "file-line"
      helm-open-github-commit-limit 10000)

;; Helm
(define-key helm-map (kbd "<up>") 'previous-history-element)
(define-key helm-map (kbd "<down>") 'next-history-element)
(define-key helm-map (kbd "M-p") 'helm-previous-source)
(define-key helm-map (kbd "M-n") 'helm-next-source)
(global-set-key (kbd "C-c h") 'helm-mini)

;; Helm Swoop
(global-set-key (kbd "M-r") 'helm-swoop)
(global-set-key (kbd "M-R") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-r") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-r") 'helm-multi-swoop-all)

;; Helm Projectile
(global-set-key (kbd "C-c ;") 'helm-projectile)
(global-set-key (kbd "C-c C-;") 'helm-projectile)

;; Helm Open Github
(global-set-key (kbd "C-c o f") 'helm-open-github-from-file)
(global-set-key (kbd "C-c o c") 'helm-open-github-from-commit)
(global-set-key (kbd "C-c o i") 'helm-open-github-from-issues)
(global-set-key (kbd "C-c o p") 'helm-open-github-from-pull-requests)


(provide 'siren-helm)
