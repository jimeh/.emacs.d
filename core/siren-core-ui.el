;;; siren-core-ui.el --- jimeh's Emacs Siren: Emacs UI settings.

;;; Commentary:

;; Basic configuration of Emacs UI for Siren.

;;; Code:

;; the toolbar is just a waste of valuable screen estate
;; in a tty tool-bar-mode does not properly auto-load, and is
;; already disabled anyway
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)

;; disable UI-based dialog boxes
(setq use-dialog-box nil)

;; disable startup screen
(setq inhibit-startup-screen t)

;; Disable Scrollbar
(if window-system (set-scroll-bar-mode 'nil))

;; nice scrolling
;; (setq scroll-margin 0
;;       scroll-conservatively 100000
;;       scroll-preserve-screen-position 1)
;; (setq redisplay-dont-pause t)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-margin 4)
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers in a non-destructive and native-comp friendly manner
(defun yes-or-no-p-advice (_orig-fun &rest args)
  "Advice to use `y-or-n-p' instead of `yes-or-no-p', passing along ARGS."
  (apply 'y-or-n-p args))

(advice-add 'yes-or-no-p :around 'yes-or-no-p-advice)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("Emacs - " (:eval (if (buffer-file-name)
                              (abbreviate-file-name (buffer-file-name))
                            "%b"))))

;; customize vertical-border character when running in terminal
(when (not window-system)
  (defun siren-change-window-divider ()
    "Change vertical-border character"
    (let ((display-table (or buffer-display-table standard-display-table)))
      (set-display-table-slot display-table
                              'vertical-border (make-glyph-code ?\u2503))
      (set-window-display-table (selected-window) display-table)))

  (add-hook 'window-configuration-change-hook 'siren-change-window-divider))

(provide 'siren-core-ui)
;;; siren-core-ui.el ends here
