;;; siren-selectrum-prescient.el --- jimeh's Emacs Siren: selectrum-prescient configuration.

;;; Commentary:

;; Basic configuration for selectrum-prescient.

;;; Code:

(require 'siren-prescient)
(require 'siren-selectrum)

(use-package selectrum-prescient
  :after (selectrum)

  :config
  (selectrum-prescient-mode +1))

(provide 'siren-selectrum-prescient)
;;; siren-selectrum-prescient.el ends here
