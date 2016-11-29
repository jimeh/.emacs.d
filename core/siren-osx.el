;;; siren-osx.el --- jimeh's Emacs Siren: OS X specific settings.

;;; Commentary:

;; OS X specific settings and tweaks for Siren.

;;; Code:

;; Set default font
(if window-system
    (set-face-attribute 'default nil :family "Monaco" :height 100))

;; modifier keys
;; (setq mac-command-modifier 'super)
;; (setq mac-option-modifier 'meta)
;; (setq ns-alternate-modifier 'meta)
;; (setq ns-command-modifier 'super)
(setq ns-function-modifier 'hyper)

;; Don't use OSX Native fullscreen mode
(setq ns-use-native-fullscreen nil)

(provide 'siren-osx)
;;; siren-osx.el ends here
