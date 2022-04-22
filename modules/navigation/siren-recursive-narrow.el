;;; siren-recursive-narrow.el --- jimeh's Emacs Siren: recursive-narrow configuration.

;;; Commentary:

;; Basic configuration for recursive-narrow.

;;; Code:

(use-package recursive-narrow
  :general
  ("C-x C-n" 'recursive-narrow-or-widen-dwim)
  ("C-x n w" 'recursive-widen)
  ("C-x n n" 'recursive-narrow-or-widen-dwim)

  :config
  (add-hook 'recursive-narrow-dwim-functions
            'siren-recursive-narrow-org-edit-src-code)
  (add-hook 'recursive-narrow-dwim-functions
            'siren-recursive-narrow-markdown-edit-code-block)

  :preface
  (defun siren-recursive-narrow-org-edit-src-code()
    (ignore-errors (org-edit-src-code) t))

  (defun siren-recursive-narrow-markdown-edit-code-block()
    (ignore-errors (markdown-edit-code-block) t)))

(provide 'siren-recursive-narrow)
;;; siren-recursive-narrow.el ends here
