;;; siren-dash-at-point.el --- jimeh's Emacs Siren: dash-at-point configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for dash-at-point.

;;; Code:

(use-package dash-at-point
  :general
  ("C-c d" 'dash-at-point)
  ("C-c e" 'dash-at-point-with-docset))

(provide 'siren-dash-at-point)
;;; siren-dash-at-point.el ends here
