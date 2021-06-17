;;; siren-xwwp.el --- jimeh's Emacs Siren: xwwp configuration.

;;; Commentary:

;; Basic configuration for xwwp.

;;; Code:

(use-package xwwp
  :bind
  (:map xwidget-webkit-mode-map
        ("v" . xwwp-follow-link)))

(provide 'siren-xwwp)
;;; siren-xwwp.el ends here
