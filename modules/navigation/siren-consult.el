;;; siren-consult.el --- jimeh's Emacs Siren: consult configuration.

;;; Commentary:

;; Basic configuration for consult.

;;; Code:

(use-package consult
  :defer t
  :bind
  ("C-t" . siren-consult-imenu)
  ("C-x b" . consult-buffer)
  ("M-g M-g" . consult-goto-line)

  :custom
  (consult-buffer-sources '(consult--source-hidden-buffer
                            consult--source-buffer
                            consult--source-project-buffer
                            consult--source-project-file))
  (consult-preview-max-count 10)
  (consult-project-root-function 'siren-consult-project-root)

  :init
  (defun siren-consult-imenu ()
    "Intelligently trigger consult-lsp-file-symbols or consult-imenu."
    (interactive)
    (if (and (fboundp 'consult-lsp-file-symbols)
             (boundp 'lsp-mode)
             lsp-mode)
        ;; consult-lsp-file-symbols errors on some language servers, in such
        ;; a case, fall back to consult-imenu.
        (condition-case _
            (consult-lsp-file-symbols)
          ('error (consult-imenu)))
      (consult-imenu)))

  (defun siren-consult-project-root (&rest args)
    "Call projectile-project-root if defined, otherwise return empty string."
    (if (fboundp 'projectile-project-root)
        (apply 'projectile-project-root args) "")))

(provide 'siren-consult)
;;; siren-consult.el ends here
