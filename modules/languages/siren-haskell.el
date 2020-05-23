;;; siren-haskell.el --- jimeh's Emacs Siren: haskell-mode configuration.

;;; Commentary:

;; Basic configuration for haskell-mode.

;;; Code:

(require 'siren-company)
(require 'siren-folding)

(use-package haskell-mode
  :bind (:map haskell-mode-map
              ("RET" . newline-and-indent))

  :hook
  (haskell-mode . siren-haskell-mode-setup)

  :init
  (defun siren-haskell-mode-setup ()
    (company-mode +1)
    (siren-folding)
    (subword-mode +1)))

(provide 'siren-haskell)
;;; siren-haskell.el ends here
