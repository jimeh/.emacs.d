;;; siren-xterm-color.el --- jimeh's Emacs Siren: xterm-color configuration.

;;; Commentary:

;; Basic configuration for xterm-color.

;;; Code:

(use-package xterm-color
  :demand t
  :custom
  (compilation-environment '("TERM=xterm-256color"))

  :preface
  (defun siren-advice-compilation-filter (f proc string)
    (funcall f proc (xterm-color-filter string)))

  :config
  (advice-add 'compilation-filter :around #'siren-advice-compilation-filter))

(provide 'siren-xterm-color)
;;; siren-xterm-color.el ends here
