;;; siren-core-macos.el --- jimeh's Emacs Siren: macOS specific settings.

;;; Commentary:

;; macOS specific settings and tweaks for Siren.

;;; Code:

;; Enable transparent titlebar
(use-package ns-auto-titlebar
  :config
  (ns-auto-titlebar-mode))

;; Set default font
(if window-system
    (set-face-attribute 'default nil :family "Monaco" :height 120))

;; macOS Fullscreen (requires Emacs 24.4 or later)
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

;; modifier keys
;; (setq mac-command-modifier 'super)
;; (setq mac-option-modifier 'meta)
;; (setq ns-alternate-modifier 'meta)
;; (setq ns-command-modifier 'super)
(setq ns-function-modifier 'hyper)

;; Don't use macOS' Native fullscreen mode.
(setq ns-use-native-fullscreen nil)

;; Set initial frame to fullscreen when Emacs starts.
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))

(provide 'siren-core-macos)
;;; siren-core-macos.el ends here
