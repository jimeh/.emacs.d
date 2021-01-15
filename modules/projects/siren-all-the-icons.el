;;; siren-all-the-icons.el --- jimeh's Emacs Siren: all-the-icons configuration.

;;; Commentary:

;; Basic configuration for all-the-icons.

;;; Code:

;; Required by all-the-icons
(use-package memoize)

(use-package all-the-icons
  :after memoize
  :if window-system)

(provide 'siren-all-the-icons)
;;; siren-all-the-icons.el ends here
