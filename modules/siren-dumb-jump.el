;;; siren-dumb-jump.el --- jimeh's Emacs Siren: dumb-jump configuration.

;;; Commentary:

;; Basic configuration for dumb-jump.

;;; Code:

;; (siren-require-packages '(dumb-jump))

(require 'siren-use-package)

(use-package dumb-jump
  :bind
  (("M-g M-o" . dumb-jump-go-other-window)
   ("M-g M-j" . dumb-jump-go)
   ("M-g M-b" . dumb-jump-back)
   ("M-g M-i" . dumb-jump-go-prompt)
   ("M-g M-x" . dumb-jump-go-prefer-external)
   ("M-g M-z" . dumb-jump-go-prefer-external-other-window))

  :config
  (setq dumb-jump-selector 'ivy))

(provide 'siren-dumb-jump)
;;; siren-dumb-jump.el ends here
