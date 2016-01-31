;;; siren-theme.el --- jimeh's Emacs Siren: Theme loading.

;;; Commentary:

;; Load the theme!

;;; Code:

(if window-system
  (require 'siren-theme-twilight-anti-bright)
  (require 'siren-theme-tomorrow-night-paradise))

(provide 'siren-theme)
;;; siren-theme.el ends here
