;;; siren-display-time.el --- jimeh's Emacs Siren: display-time-mode.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for display-time-mode.

;;; Code:

(use-package time
  :straight (:type built-in)
  :custom
  (display-time-interval 1)
  (display-time-24hr-format t)
  (display-time-day-and-date t)
  (display-time-load-average-threshold 0.0)
  (display-time-default-load-average 0)
  (display-time-format "%a %e %b %T")

  :config
  (display-time-mode t))

(provide 'siren-display-time)
;;; siren-display-time.el ends here
