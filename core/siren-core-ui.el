;;; siren-core-ui.el --- jimeh's Emacs Siren: Emacs UI settings.

;;; Commentary:

;; Basic configuration of Emacs UI for Siren.

;;; Code:

(require 'siren-core-transparency)

;; the toolbar is just a waste of valuable screen estate
;; in a tty tool-bar-mode does not properly auto-load, and is
;; already disabled anyway
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; Disable Scrollbar
(if window-system (set-scroll-bar-mode 'nil))

;; nice scrolling
;; (setq scroll-margin 0
;;       scroll-conservatively 100000
;;       scroll-preserve-screen-position 1)
;; (setq redisplay-dont-pause t)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 10))) ;; one line at a time
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-margin 4)
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("Emacs - " (:eval (if (buffer-file-name)
                              (abbreviate-file-name (buffer-file-name))
                            "%b"))))

(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
;; delegate theming to the currently active theme
(setq sml/theme nil)
(add-hook 'after-init-hook #'sml/setup)

(provide 'siren-core-ui)
;;; siren-core-ui.el ends here
