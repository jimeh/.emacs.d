;;; siren-core-linux.el --- jimeh's Emacs Siren: Linux specific settings.

;;; Commentary:

;; Linux specific settings and tweaks for Siren.

;;; Code:

;; Set default font
(if window-system
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
      (set-face-attribute 'default nil :family family :height 90)))

;; Keybindinds
(siren-general-define-key
 "s-<return>" 'toggle-frame-fullscreen)

;; Set initial frame to fullscreen when Emacs starts.
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(provide 'siren-core-linux)
;;; siren-core-linux.el ends here
