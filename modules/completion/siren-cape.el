;;; siren-cape.el --- jimeh's Emacs Siren: cape configuration.

;;; Commentary:

;; Basic configuration for cape. Auto completion on steroids.

;;; Code:

(require 'siren-company)

(use-package cape
  :after company
  :hook
  (lsp-completion-mode . siren-cape-capf-lsp-mode-setup)

  :preface
  (defalias 'siren-yasnippet-capf
    (cape-company-to-capf 'company-yasnippet))

  (defun siren-cape-capf-lsp-mode-setup ()
    (siren-cape-capf-add-hooks t))

  (defun siren-cape-capf-add-hooks (&optional local)
    (if local (make-local-variable 'completion-at-point-functions))
    ;; Use `siren-prepend' function instead of `add-hook' to ensure our custom
    ;; completion functions are listed before `lsp-completion-at-point'.
    (siren-prepend completion-at-point-functions 'cape-file)
    (siren-prepend completion-at-point-functions 'siren-yasnippet-capf))

  (defun siren-cape-capf-remove-hooks (&optional local)
    (remove-hook 'completion-at-point-functions 'siren-yasnippet-capf local)
    (remove-hook 'completion-at-point-functions 'cape-file local))

  :init
  (siren-cape-capf-add-hooks))

(provide 'siren-cape)
;;; siren-cape.el ends here
