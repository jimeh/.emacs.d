;;; siren-thrift.el --- jimeh's Emacs Siren: thrift-mode configuration.

;;; Commentary:

;; Basic configuration for thrift-mode.

;;; Code:

(use-package thrift
  :mode "\\.thrift\\'"

  :config
  (require 'siren-programming)

  (defun siren-thrift-mode-defaults ()
    (siren-prog-mode-defaults)

    (setq tab-width 2)
    (highlight-indentation-current-column-mode)
    (subword-mode +1))

  (setq siren-thrift-mode-hook 'siren-thrift-mode-defaults)
  (add-hook 'thrift-mode-hook (lambda ()
                                (run-hooks 'siren-thrift-mode-hook))))

(provide 'siren-thrift)
;;; siren-thrift.el ends here
