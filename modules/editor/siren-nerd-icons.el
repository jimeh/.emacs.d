;;; siren-nerd-icons.el --- jimeh's Emacs Siren: nerd-icons configuration.

;;; Commentary:

;; Basic configuration for nerd-icons.

;;; Code:

(use-package nerd-icons
  :custom
  (nerd-icons-scale-factor 1.0)
  (nerd-icons-default-adjust 0.0)
  :config
  (let ((font "Menlo Nerd Font"))
    (if (member font (font-family-list))
        (setq nerd-nerd-icons-font-family font))))

(use-package nerd-icons-completion
  :straight
  (nerd-icons-completion :type git :host github
                         :repo "rainstormstudio/nerd-icons-completion")
  :if (not window-system)
  :demand t
  :hook
  (marginalia-mode . nerd-icons-completion-marginalia-setup)

  :config
  (nerd-icons-completion-mode))

(use-package nerd-icons-dired
  :straight (nerd-icons-dired :type git :host github
                              :repo "rainstormstudio/nerd-icons-dired")
  :if (not window-system)
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-ibuffer
  :if (not window-system)
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package treemacs-nerd-icons
  :straight (treemacs-nerd-icons :type git :host github
                                 :repo "rainstormstudio/treemacs-nerd-icons")
  :if (not window-system)
  :config
  (with-eval-after-load 'treemacs
    (treemacs-load-theme "nerd-icons")))

(provide 'siren-nerd-icons)
;;; siren-nerd-icons.el ends here
