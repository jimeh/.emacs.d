;;; siren-all-the-icons.el --- jimeh's Emacs Siren: all-the-icons configuration.

;;; Commentary:

;; Basic configuration for all-the-icons.

;;; Code:

(require 'siren-marginalia)

;; Required by all-the-icons
(use-package memoize)

(use-package all-the-icons
  :after memoize
  :if window-system
  :custom
  (all-the-icons-scale-factor 1.0)
  (all-the-icons-default-adjust -0.2))

(provide 'siren-all-the-icons)
;;; siren-all-the-icons.el ends here
