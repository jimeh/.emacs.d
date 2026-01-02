;;; siren-flycheck-erblint.el --- jimeh's Emacs Siren: flycheck-erblint configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for flycheck-erblint.

;;; Code:

(require 'siren-flycheck)

(use-package flycheck-erblint
  :ensure nil ;; from vendor directory
  :after flycheck
  :config
  (flycheck-erblint-setup))

(provide 'siren-flycheck-erblint)
;;; siren-flycheck-erblint.el ends here
