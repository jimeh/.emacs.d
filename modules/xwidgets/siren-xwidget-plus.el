;;; siren-xwidget-plus.el --- jimeh's Emacs Siren: xwidget-plus configuration.

;;; Commentary:

;; Basic configuration for xwidget-plus.

;;; Code:

(require 'siren-ido)

(use-package xwidget-plus
  :straight (:type git :host github :repo "canatella/xwidget-plus")

  :hook
  (xwidget-webkit-mode . siren-xwidget-plus-setup)

  :custom
  (xwidget-plus-completion-backend 'ido)

  :init
  (defun siren-xwidget-plus-setup ()
    (define-key xwidget-webkit-mode-map (kbd "v") 'xwidget-plus-follow-link)))

(provide 'siren-xwidget-plus)
;;; siren-xwidget-plus.el ends here
