;;; siren-ox-pandoc.el --- jimeh's Emacs Siren: ox-pandoc configuration.

;;; Commentary:

;; Basic configuration for ox-pandoc.

;;; Code:

(require 'siren-org-mode)

(use-package ox-pandoc
  :defer t

  :hook
  (org-mode . siren-ox-pandoc-setup)

  :custom
  (org-pandoc-options-for-gfm '((columns . "80")))
  (org-pandoc-options-for-markdown '((columns . "80")))
  (org-pandoc-options-for-org '((columns . "80")))

  :init
  (defun siren-ox-pandoc-setup ()
    (require 'ox-pandoc)))

(provide 'siren-ox-pandoc)
;;; siren-ox-pandoc.el ends here
