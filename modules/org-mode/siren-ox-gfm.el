;;; siren-ox-gfm.el --- jimeh's Emacs Siren: ox-gfm configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for ox-gfm.

;;; Code:

(require 'siren-org-mode)

(use-package ox-gfm
  :defer t

  :hook
  (org-mode . siren-ox-gfm-setup)

  :preface
  (defun siren-ox-gfm-setup ()
    (require 'ox-gfm)))

(provide 'siren-ox-gfm)
;;; siren-ox-gfm.el ends here
