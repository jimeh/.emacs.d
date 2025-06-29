;;; siren-haskell.el --- jimeh's Emacs Siren: haskell-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for haskell-mode.

;;; Code:

(require 'siren-hideshow)

(use-package haskell-mode
  :general
  (:keymaps 'haskell-mode-map
            "RET" 'newline-and-indent)

  :hook
  (haskell-mode . siren-haskell-mode-setup)

  :preface
  (defun siren-haskell-mode-setup ()
    (hs-minor-mode t)))

(provide 'siren-haskell)
;;; siren-haskell.el ends here
