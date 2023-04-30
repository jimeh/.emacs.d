;;; siren-core-macos.el --- jimeh's Emacs Siren: macOS specific settings.

;;; Commentary:

;; macOS specific settings and tweaks for Siren.

;;; Code:

;; Enable transparent titlebar
(use-package ns-auto-titlebar
  :config
  (ns-auto-titlebar-mode))

;; Enable use of macOS trash
(use-package osx-trash
  :custom
  (delete-by-moving-to-trash t)

  :config
  (osx-trash-setup))

;; When running in GUI mode.
(when window-system
  ;; Set default font based on priority list
  (let* ((families '("Menlo Nerd Font"
                     "Menlo Nerd Font Mono"
                     "Menlo for Powerline"
                     "Menlo"
                     "Monaco Nerd Font Mono"
                     "Monaco for Powerline"
                     "Monaco"))
         (available (font-family-list))
         (family (catch 'found
                   (dolist (f families)
                     (if (member f available)
                         (throw 'found f))))))
    (set-face-attribute 'default nil :family family :height 120))

  ;; Fix the default default-directory value.
  (if (string= default-directory "/")
      (setq default-directory "~/")))

;; macOS Fullscreen (requires Emacs 24.4 or later)
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-s-<return>") 'toggle-frame-fullscreen)

;; modifier keys
;; (setq mac-command-modifier 'super)
;; (setq mac-option-modifier 'meta)
;; (setq ns-alternate-modifier 'meta)
;; (setq ns-command-modifier 'super)
(setq ns-function-modifier 'hyper)

;; Don't use macOS' Native fullscreen mode.
(setq ns-use-native-fullscreen nil)

;; Set initial frame to fullscreen when Emacs starts.
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Override default ctrl+scroll text size keybindings on macOS to not have any
;; effect.
(defun siren-mouse-wheel-text-scale (_event)
  "Custom version of `mouse-wheel-text-scale' which does NOTHING.

macOS scroll momentum often leads to excessive text size changes
when using ctrl-based keybindings right after scrolling up/down.
This is very annoying, and in extreme cases locks up Emacs for
minutes as it's trying to reach 100,000 font size or something
crazy."
  (interactive (list last-input-event)))

(global-set-key (kbd "C-<wheel-down>") 'siren-mouse-wheel-text-scale)
(global-set-key (kbd "C-<wheel-up>") 'siren-mouse-wheel-text-scale)

(provide 'siren-core-macos)
;;; siren-core-macos.el ends here
