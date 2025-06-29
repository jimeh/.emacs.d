;;; siren-xwwp.el --- jimeh's Emacs Siren: xwwp configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for xwwp.

;;; Code:

(use-package xwwp
  :general
  (:keymaps 'xwidget-webkit-mode-map
            "v" 'xwwp-follow-link))

(provide 'siren-xwwp)
;;; siren-xwwp.el ends here
