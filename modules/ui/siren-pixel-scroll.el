;;; siren-pixel-scroll.el --- jimeh's Emacs Siren: pixel-scroll.

;;; Commentary:

;; Enable and configure pixel-scroll-precision-mode on Emacs 29.x and later when
;; running in a window system.

;;; Code:

(when (fboundp 'pixel-scroll-precision-mode)
  (use-package pixel-scroll
    :straight (:type built-in)
    :if window-system

    :preface
    (defvar siren-pixel-scroll--original-scroll-margin scroll-margin)
    (defvar siren-pixel-scroll--original-scroll-preserve-screen-position
      scroll-preserve-screen-position)

    (define-minor-mode siren-pixel-scroll-mode
      "Enable pixel-scroll-precision-mode with other tweaks."
      :global t
      (if siren-pixel-scroll-mode
          (progn
            (setq pixel-scroll-precision-interpolate-page t)
            (setq pixel-scroll-precision-large-scroll-height 40.0)
            (setq pixel-scroll-precision-interpolation-factor 30)
            (setq pixel-scroll-precision-use-momentum
                  (not (eq system-type 'darwin)))
            (setq siren-pixel-scroll--original-scroll-margin scroll-margin)
            (setq scroll-margin 0)
            (setq siren-pixel-scroll--original-scroll-preserve-screen-position
                  scroll-preserve-screen-position)
            (setq scroll-preserve-screen-position 'always)

            (pixel-scroll-precision-mode +1))
        (progn
          (pixel-scroll-precision-mode -1)
          (setq scroll-margin siren-pixel-scroll--original-scroll-margin)
          (setq scroll-preserve-screen-position
                siren-pixel-scroll--original-scroll-preserve-screen-position))))))

(provide 'siren-pixel-scroll)
;;; siren-pixel-scroll.el ends here
