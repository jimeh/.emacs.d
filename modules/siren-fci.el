;;; siren-fci.el --- jimeh's Emacs Siren: fill-column-indicator configuration.

;;; Commentary:

;; Basic configuration for fill-column-indicator.

;;; Code:

(siren-require-packages '(fill-column-indicator))

(require 'fill-column-indicator)
(setq fci-rule-width 1
      fci-handle-trucate-lines nil)

(provide 'siren-fci)
;;; siren-fci.el ends here
