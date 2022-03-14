;;; siren-mwim.el --- jimeh's Emacs Siren: mwim configuration.

;;; Commentary:

;; Basic configuration for mwim.

;;; Code:

(use-package mwim
  :general
  ("C-a" 'mwim-beginning)
  ("C-e" 'mwim-end))

(provide 'siren-mwim)
;;; siren-mwim.el ends here
