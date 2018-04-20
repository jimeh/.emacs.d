;;; siren-linum.el --- jimeh's Emacs Siren: linum configuration.

;;; Commentary:

;; Basic configuration for linum.

;;; Code:

(use-package linum+
  :ensure nil ;; loaded from vendor
  :demand

  :init
  ;; Customize line numbers - In GUI mode the fringe is the spacer between line
  ;; numbers and code, while in console mode we add an extra space for it.
  (if window-system (setq linum+-dynamic-format " %%%dd")
    (setq linum+-dynamic-format " %%%dd "))

  :config
  (setq linum-format 'dynamic))

(provide 'siren-linum)
;;; siren-linum.el ends here
