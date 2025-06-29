;;; siren-core-macos.el --- jimeh's Emacs Siren: macOS specific settings.  -*- lexical-binding: nil; -*-

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
  (let* ((families '("Menlo Nerd Font Mono"
                     "Menlo Nerd Font"
                     "Menlo Nerd Font Propo"
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
      (setq default-directory "~/"))

  (defun delete-child-frames (&optional frame)
    "Close all child frames of FRAME.
If FRAME is nil, it defaults to the currently selected frame."
    (interactive)
    (let ((frame (or frame (selected-frame))))
      (dolist (f (frame-list))
        (when (eq (frame-parent f) frame)
          (delete-frame f)))))

  (defun siren-toggle-frame-fullscreen-advice (&optional frame)
    "If `ns-use-native-fullscreen' is not t, close all child frames of FRAME.
If FRAME is nil, it defaults to the currently selected frame."
    (unless ns-use-native-fullscreen
      (delete-child-frames frame)))

  ;; On macOS when using non-native fullscreen, child-frames re-appear and are
  ;; stuck on top of the main frame when fullscreen is enabled. This advice
  ;; closes all child-frames when toggling fullscreen state to avoid this.
  (advice-add 'toggle-frame-fullscreen :after
              #'siren-toggle-frame-fullscreen-advice))

;; macOS Fullscreen (requires Emacs 24.4 or later)
(siren-general-define-key
 "s-<return>" 'toggle-frame-fullscreen
 "C-s-<return>" 'toggle-frame-fullscreen)

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

(siren-general-define-key
 "C-<wheel-down>" 'siren-mouse-wheel-text-scale
 "C-<wheel-up>" 'siren-mouse-wheel-text-scale)

(provide 'siren-core-macos)
;;; siren-core-macos.el ends here
