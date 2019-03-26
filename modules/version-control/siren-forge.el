;;; siren-forge.el --- jimeh's Emacs Siren: forge configuration

;;; Commentary:

;; Basic configuration for forge.

;;; Code:

(require 'siren-magit)

(use-package forge
  :after magit)

(provide 'siren-forge)
;;; siren-forge.el ends here