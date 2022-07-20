;;; siren-consult.el --- jimeh's Emacs Siren: consult configuration.

;;; Commentary:

;; Basic configuration for consult.

;;; Code:

(require 'siren-projectile)

(eval-when-compile
  (require 'cl-lib))

(use-package consult
  :defer t
  :general
  ("C-t" 'siren-consult-imenu)
  ("C-x b" 'consult-buffer)
  ("C-c b" 'consult-project-buffer)
  ("M-g M-g" 'consult-goto-line)

  :custom
  (consult-buffer-sources '(consult--source-hidden-buffer
                            consult--source-modified-buffer
                            consult--source-buffer
                            consult--source-bookmark
                            consult--source-project-buffer))
  (consult-preview-max-count 10)

  :config
  (setq consult-project-root-function 'projectile-project-root)

  :preface
  (defun siren-consult-imenu ()
    "Intelligently trigger consult-lsp-file-symbols or consult-imenu."
    (interactive)
    (if (and (fboundp 'consult-lsp-file-symbols)
             (boundp 'lsp-mode)
             lsp-mode)
        ;; consult-lsp-file-symbols errors on some language servers, in such
        ;; a case, fall back to consult-imenu.
        (condition-case nil
            (consult-lsp-file-symbols)
          ('error (consult-imenu)))
      (consult-imenu))))

(provide 'siren-consult)
;;; siren-consult.el ends here
