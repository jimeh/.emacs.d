;;; siren-nerd-icons.el --- jimeh's Emacs Siren: nerd-icons configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for nerd-icons.

;;; Code:

(use-package nerd-icons
  :custom
  (nerd-icons-scale-factor 1.0)
  (nerd-icons-default-adjust 0.0)
  :config
  (when (and (display-graphic-p nil)
             (not (member "Symbols Nerd Font Mono" (font-family-list))))
    (nerd-icons-install-fonts)))

(use-package nerd-icons-completion
  :demand t
  :hook
  (marginalia-mode . nerd-icons-completion-marginalia-setup)

  :config
  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql project-buffer)))
    "Return the icon for the candidate CAND of completion category project-buffer."
    (nerd-icons-completion-get-icon cand 'buffer))

  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql tab)))
    "Display tab icon for nerd-icons-completion."
    (concat (nerd-icons-mdicon "nf-md-tab" :face 'nerd-icons-blue) " "))

  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql command)))
    "Display command icon for nerd-icons-completion."
    (concat (nerd-icons-mdicon "nf-md-cog" :face 'nerd-icons-blue) " "))

  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql mode)))
    "Display mode icon for nerd-icons-completion."
    (concat (nerd-icons-octicon "nf-oct-package" :face 'nerd-icons-blue) " "))

  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql function)))
    "Display function icon for nerd-icons-completion."
    (if (commandp (intern cand))
        (concat (nerd-icons-octicon "nf-oct-gear" :face 'nerd-icons-blue) " ")
      (concat (nerd-icons-octicon "nf-oct-package" :face 'nerd-icons-purple) " ")))

  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql variable)))
    "Display function icon for nerd-icons-completion."
    (if (custom-variable-p (intern cand))
        (concat (nerd-icons-octicon "nf-oct-tag" :face 'nerd-icons-lblue) " ")
      (concat (nerd-icons-mdicon "nf-md-tag" :face 'nerd-icons-lblue) " ")))

  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql face)))
    "Display face icon for nerd-icons-completion."
    (concat (nerd-icons-mdicon "nf-md-palette" :face 'nerd-icons-blue) " "))

  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql history)))
    "Display history icon for nerd-icons-completion."
    (concat (nerd-icons-octicon "nf-oct-history" :face 'nerd-icons-blue) " "))

  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql theme)))
    "Display theme icon for nerd-icons-completion."
    (concat (nerd-icons-mdicon "nf-md-palette" :face 'nerd-icons-lcyan) " "))

  (defun nerd-icons-completion--counsel-imenu-symbol (cand)
    "Return imenu symbol from CAND."
    (let ((str (split-string cand ": ")))
      (or (cadr str) (car str))))

  (cl-defmethod nerd-icons-completion-get-icon (cand (_cat (eql symbol)))
    "Display the symbol icon all-the-icons-completion."
    (let ((sym (intern (nerd-icons-completion--counsel-imenu-symbol cand))))
      (cond
       ((string-match-p "Packages?[:)]" cand)
        (all-the-icons-octicon "nf-oct-archive" :face 'nerd-icons-silver))
       ((or (functionp sym) (macrop sym))
        (nerd-icons-completion-get-icon cand 'function))
       ((facep sym)
        (nerd-icons-completion-get-icon cand 'face))
       ((symbolp sym)
        (nerd-icons-completion-get-icon cand 'variable))
       (t (nerd-icons-octicon "nf-oct-gear" :face 'all-the-icons-silver)))))

  (nerd-icons-completion-mode))

;; Disable for now, as having it enabled causes dired to not reliably select the
;; current buffer when opening dired for directory of current buffer.
;; (use-package nerd-icons-dired
;;   :straight (nerd-icons-dired :type git :host github
;;                               :repo "rainstormstudio/nerd-icons-dired")
;;   :hook
;;   (dired-mode . nerd-icons-dired-mode)
;;   :custom
;;   (nerd-icons-dired-v-adjust 0.01))

(use-package nerd-icons-ibuffer
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package treemacs-nerd-icons
  :config
  (with-eval-after-load 'treemacs
    (treemacs-load-theme "nerd-icons")))

(provide 'siren-nerd-icons)
;;; siren-nerd-icons.el ends here
