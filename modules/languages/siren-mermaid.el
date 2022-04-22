;;; siren-mermaid.el --- jimeh's Emacs Siren: mermaid-mode configuration.

;;; Commentary:

;; Basic configuration for mermaid-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package mermaid-mode
  :mode "\\.mermaid\\'" "\\.mmd\\'"

  :hook
  (mermaid-mode . siren-mermaid-mode-setup)

  :preface
  (defun siren-mermaid-mode-setup ()
    (run-hooks 'prog-mode-hook)))

(provide 'siren-mermaid)
;;; siren-mermaid.el ends here
