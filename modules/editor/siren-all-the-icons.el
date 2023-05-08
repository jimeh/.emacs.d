;;; siren-all-the-icons.el --- jimeh's Emacs Siren: all-the-icons configuration.

;;; Commentary:

;; Basic configuration for all-the-icons.

;;; Code:

(require 'siren-marginalia)

;; Required by all-the-icons
(use-package memoize)

(use-package all-the-icons
  :after memoize
  :if window-system
  :custom
  (all-the-icons-scale-factor 1.0)
  (all-the-icons-default-adjust -0.2))

(use-package all-the-icons-ibuffer
  :after all-the-icons
  :if window-system
  :hook
  (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package all-the-icons-dired
  :after all-the-icons
  :if window-system
  :hook
  (dired-mode . all-the-icons-dired-mode)
  :custom
  (all-the-icons-dired-monochrome nil)
  (all-the-icons-dired-v-adjust -0.05))

(use-package treemacs-all-the-icons
  :after (all-the-icons treemacs)
  :if window-system
  :config
  (treemacs-load-theme "all-the-icons"))

(use-package all-the-icons-completion
  :after (all-the-icons marginalia)
  :if window-system
  :demand t
  :hook
  (marginalia-mode . all-the-icons-completion-marginalia-setup)

  :config
  (all-the-icons-completion-mode)

  ;; Using original all-the-icons-completion package.
  (when (fboundp 'all-the-icons-completion-get-file-icon)
    ;; Override default category lookup function to add support for
    ;; project-buffer and project-file.
    (defun all-the-icons-completion-get-icon (cand cat)
      "Return the icon for the candidate CAND of completion category CAT."
      (cl-case cat
        (file (all-the-icons-completion-get-file-icon cand))
        (project-file (all-the-icons-completion-get-file-icon cand))
        (buffer (all-the-icons-completion-get-buffer-icon cand))
        (project-buffer (all-the-icons-completion-get-buffer-icon cand))
        (t ""))))

  ;; Using MintSoup's fork of all-the-icons-completion.
  (when (not (fboundp 'all-the-icons-completion-get-file-icon))
    (require 'cl-generic)

    ;; Add support for 'project-buffer category by treating it same as 'buffer.
    (cl-defmethod all-the-icons-completion-get-icon ((cand string) (cat (eql 'project-buffer)))
      (all-the-icons-completion-get-icon cand 'buffer))))

;; (defun siren-all-icons-complete-wrap (orig-fun &rest args)
;;   "Wrap `all-the-icons-completion' to use `siren-all-icons-complete' instead."
;;   (message "args: %s" args)
;;   (apply orig-fun args))
;; (advice-add 'all-the-icons-completion-get-icon :around #'siren-all-icons-complete-wrap)

(provide 'siren-all-the-icons)
;;; siren-all-the-icons.el ends here
