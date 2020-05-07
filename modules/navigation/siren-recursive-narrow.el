;;; siren-recursive-narrow.el --- jimeh's Emacs Siren: recursive-narrow configuration.

;;; Commentary:

;; Basic configuration for recursive-narrow.

;;; Code:

(use-package recursive-narrow
  :bind
  ("C-x C-n" . recursive-narrow-or-widen-dwim)
  ("C-x n w" . recursive-widen)
  ("C-x n n" . recursive-narrow-or-widen-dwim)

  :config
  (add-hook 'recursive-narrow-dwim-functions
            'siren-recursive-narrow-org-edit-src-code)

  :init
  (defun siren-recursive-narrow-org-edit-src-code()
    (ignore-errors (org-edit-src-code) t)))

(provide 'siren-recursive-narrow)
;;; siren-recursive-narrow.el ends here
