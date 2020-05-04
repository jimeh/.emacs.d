;;; siren-ob-mermaid.el --- jimeh's Emacs Siren: ob-mermaid configuration.

;;; Commentary:

;; Basic configuration for ob-mermaid.

;;; Code:

(require 'siren-org-mode)

(use-package ob-mermaid
  :defer t

  :hook
  (org-mode . siren-ob-mermaid-setup)

  :init
  (defun siren-ob-mermaid-setup ()
    (require 'ob-mermaid)))

(provide 'siren-ob-mermaid)
;;; siren-ob-mermaid.el ends here
