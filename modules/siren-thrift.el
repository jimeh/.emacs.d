;;; siren-thrift.el --- jimeh's Emacs Siren: thrift-mode configuration.

;;; Commentary:

;; Basic configuration for thrift-mode.

;;; Code:

(require 'siren-programming)

(use-package thrift
  :mode "\\.thrift\\'"
  :hook (thrift-mode-hook . siren-thrift-mode-setup)

  :init
  (defun siren-thrift-mode-setup ()
    (siren-prog-mode-setup)

    (setq tab-width 2)
    (highlight-indentation-current-column-mode)
    (subword-mode +1)))

(provide 'siren-thrift)
;;; siren-thrift.el ends here
