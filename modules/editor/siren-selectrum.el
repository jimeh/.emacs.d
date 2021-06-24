;;; siren-selectrum.el --- jimeh's Emacs Siren: selectrum configuration.

;;; Commentary:

;; Basic configuration for selectrum.

;;; Code:

(use-package selectrum
  :custom
  (selectrum-display-action nil)
  (selectrum-extend-current-candidate-highlight t)
  (selectrum-fix-vertical-window-height t)
  (selectrum-max-window-height 12)

  :config
  (selectrum-mode +1))

(provide 'siren-selectrum)
;;; siren-selectrum.el ends here
