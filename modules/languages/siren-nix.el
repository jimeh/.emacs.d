;;; siren-nix.el --- jimeh's Emacs Siren: nix-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for nix-mode.

;;; Code:

(require 'siren-lsp)

(use-package nix-mode
  :mode
  "\\.nix\\'"

  :hook
  (nix-mode . siren-nix-mode-setup)

  :preface
  (defun siren-nix-mode-setup ()))

(provide 'siren-nix)
;;; siren-nix.el ends here
