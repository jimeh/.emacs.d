;;; siren-ob-go.el --- jimeh's Emacs Siren: ob-go configuration.

;;; Commentary:

;; Basic configuration for ob-go.

;;; Code:

(require 'siren-org-mode)

(use-package ob-go
  :defer t

  :hook
  (org-mode . siren-ob-go-setup)

  :preface
  (defun siren-ob-go-setup ()
    (require 'ob-go)))

(provide 'siren-ob-go)
;;; siren-ob-go.el ends here
