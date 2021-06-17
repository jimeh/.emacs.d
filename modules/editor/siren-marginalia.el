;;; siren-marginalia.el --- jimeh's Emacs Siren: marginalia configuration.

;;; Commentary:

;; Basic configuration for marginalia.

;;; Code:

(use-package marginalia
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode +1))

(provide 'siren-marginalia)
;;; siren-marginalia.el ends here
