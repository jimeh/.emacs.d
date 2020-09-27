;;; siren-jsonnet.el --- jimeh's Emacs Siren: jsonnet-mode configuration.

;;; Commentary:

;; Basic configuration for jsonnet-mode.

;;; Code:

(use-package jsonnet-mode
  :hook
  (jsonnet-mode . siren-jsonnet-mode-setup)

  :init
  (defun siren-jsonnet-mode-setup ()
    "Default tweaks for `jsonnet-mode'."))

(provide 'siren-jsonnet)
;;; siren-js.el ends here
