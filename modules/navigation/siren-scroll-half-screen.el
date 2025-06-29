;;; siren-scroll-half-screen.el --- jimeh's Emacs Siren: scroll-half-screen.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Scroll up/down M-v/C-v half a screen instead of a full screen.

;;; Code:

;; Scroll half a screen when using scroll-up and scroll-down functions.
(defadvice scroll-up (around half-window activate)
  (setq next-screen-context-lines
        (max 1 (/ (1- (window-height (selected-window))) 2)))
  ad-do-it)

(defadvice scroll-down (around half-window activate)
  (setq next-screen-context-lines
        (max 1 (/ (1- (window-height (selected-window))) 2)))
  ad-do-it)

(provide 'siren-scroll-half-screen)
;;; siren-scroll-half-screen.el ends here
