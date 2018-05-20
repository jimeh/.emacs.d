;;; siren-treemacs.el --- jimeh's Emacs Siren: treemacs configuration.

;;; Commentary:

;; Basic configuration for treemacs.

;;; Code:

(use-package treemacs
  :defer t

  :bind
  ([f8]         . treemacs-toggle)
  ("M-0"        . treemacs-select-window)
  ("C-c 1"      . treemacs-delete-other-windows)
  ;; ("M-m ft"     . treemacs-toggle)
  ;; ("M-m fT"     . treemacs)
  ;; ("M-m fB"     . treemacs-bookmark)
  ;; ("M-m f C-t"  . treemacs-find-file)
  ;; ("M-m f M-t" . treemacs-find-tag)

  :config
  (progn
    (use-package treemacs-evil
      :ensure t
      :demand t)
    (setq treemacs-follow-after-init          t
          treemacs-width                      35
          treemacs-indentation                2
          treemacs-git-integration            t
          treemacs-collapse-dirs              3
          treemacs-silent-refresh             nil
          treemacs-change-root-without-asking t
          treemacs-sorting                    'alphabetic-desc
          treemacs-show-hidden-files          t
          treemacs-never-persist              nil
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)))

(use-package treemacs-projectile
  :defer t
  :bind
  ("C-x C-p" . treemacs-projectile)
  ("C-x C-p" . treemacs-projectile-toggle)

  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))

(provide 'siren-treemacs)
;;; siren-treemacs.el ends here
