;;; siren-fci.el --- jimeh's Emacs Siren: fill-column-indicator configuration.

;;; Commentary:

;; Basic configuration for fill-column-indicator.

;;; Code:

(use-package fill-column-indicator
  :hook (prog-mode . fci-mode)
  :config
  (setq fci-handle-line-move-visual nil
        fci-handle-truncate-lines nil
        fci-rule-width 1))

(provide 'siren-fci)
;;; siren-fci.el ends here
