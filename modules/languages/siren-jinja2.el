;;; siren-jinja2.el --- jimeh's Emacs Siren: jinja2-mode configuration.

;;; Commentary:

;; Basic configuration for jinja2-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package jinja2-mode
  :hook
  (jinja2-mode . siren-jinja2-mode-setup)

  :init
  (defun siren-jinja2-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (subword-mode +1)))

(provide 'siren-jinja2)
;;; siren-jinja2.el ends here
