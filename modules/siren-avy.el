;;; siren-avy.el --- jimeh's Emacs Siren: avy configuration.

;;; Commentary:

;; Basic configuration for avy.  Avy allows us to effectively navigate to
;; visible things.

;;; Code:

(use-package avy
  :bind
  ("C-c C-j" . avy-goto-word-or-subword-1)
  ("C-c SPC" . avy-goto-char)
  ("M-o" . ace-window)

  :config
  (setq avy-background t
        avy-style 'at-full))

(use-package ace-window
  :bind
  ("M-o" . ace-window))

(provide 'siren-avy)
;;; siren-avy.el ends here
