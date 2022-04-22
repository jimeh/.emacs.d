;;; siren-all-the-icons.el --- jimeh's Emacs Siren: all-the-icons configuration.

;;; Commentary:

;; Basic configuration for all-the-icons.

;;; Code:

;; Required by all-the-icons
(use-package memoize)

(use-package all-the-icons
  :after memoize
  :if window-system)

(use-package all-the-icons-ibuffer
  :after all-the-icons
  :if window-system
  :init
  (all-the-icons-ibuffer-mode 1))

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :if window-system
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode)

  :config
  ;; Override default category lookup function.
  (defun all-the-icons-completion-get-icon (cand cat)
    "Return the icon for the candidate CAND of completion category CAT."
    (cl-case cat
      (file (all-the-icons-completion-get-file-icon cand))
      (project-file (all-the-icons-completion-get-file-icon cand))
      (buffer (all-the-icons-completion-get-buffer-icon cand))
      (project-buffer (all-the-icons-completion-get-buffer-icon cand))
      (t ""))))

(provide 'siren-all-the-icons)
;;; siren-all-the-icons.el ends here
