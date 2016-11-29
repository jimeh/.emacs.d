;;; siren-linux.el --- jimeh's Emacs Siren: Linux specific settings.

;;; Commentary:

;; Linux specific settings and tweaks for Siren.

;;; Code:

;; Set default font
(if window-system
    (set-face-attribute 'default nil :family "Monaco" :height 80))

(provide 'siren-linux)
;;; siren-linux.el ends here
