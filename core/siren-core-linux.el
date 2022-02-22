;;; siren-core-linux.el --- jimeh's Emacs Siren: Linux specific settings.

;;; Commentary:

;; Linux specific settings and tweaks for Siren.

;;; Code:

;; Set default font
(if window-system
    ;; Set default font based on priority list
    (let* ((families '("Menlo Nerd Font Mono"
                       "Menlo for Powerline"
                       "Menlo"
                       "Monaco Nerd Font Mono"
                       "Monaco for Powerline"
                       "Monaco"))
           (family (catch 'found
                     (dolist (f families)
                       (if (member f (font-family-list))
                           (throw 'found f))))))
      (set-face-attribute 'default nil :family family :height 90)))

;; Keybindinds
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

(provide 'siren-core-linux)
;;; siren-core-linux.el ends here
