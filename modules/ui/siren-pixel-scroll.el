;;; siren-pixel-scroll.el --- jimeh's Emacs Siren: pixel-scroll.

;;; Commentary:

;; Enable and configure pixel-scroll-precision-mode on Emacs 29.x and later when
;; running in a window system.

;;; Code:

(when (fboundp 'pixel-scroll-precision-mode)
  (use-package pixel-scroll
    :straight (:type built-in)
    :if window-system

    :custom
    ;; Only affects keyboard-based scrolling when pixel scrolling is enabled.
    (scroll-preserve-screen-position 'always)
    (scroll-margin 0)
    (pixel-scroll-precision-interpolate-page t)
    (pixel-scroll-precision-large-scroll-height 40.0)
    (pixel-scroll-precision-interpolation-factor 30)
    (pixel-scroll-precision-use-momentum (not (eq system-type 'darwin)))

    :config
    (pixel-scroll-precision-mode +1)))

(provide 'siren-pixel-scroll)
;;; siren-pixel-scroll.el ends here
