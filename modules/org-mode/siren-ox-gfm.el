;;; siren-ox-gfm.el --- jimeh's Emacs Siren: ox-gfm configuration.

;;; Commentary:

;; Basic configuration for ox-gfm.

;;; Code:

(require 'siren-org-mode)

(use-package ox-gfm
  :defer t

  :hook
  (org-mode . siren-ox-gfm-setup)

  :init
  (defun siren-ox-gfm-setup ()
    (require 'ox-gfm)))

(provide 'siren-ox-gfm)
;;; siren-ox-gfm.el ends here
