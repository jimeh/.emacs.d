;;; siren-editorconfig.el --- jimeh's Emacs Siren: editorconfig configuration.

;;; Commentary:

;; Basic configuration for editorconfig.

;;; Code:

(siren-require-packages '(editorconfig))

(require 'editorconfig)
(editorconfig-mode 1)

(provide 'siren-editorconfig)
;;; siren-editorconfig.el ends here
