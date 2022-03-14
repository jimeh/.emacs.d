;;; siren-grip.el --- jimeh's Emacs Siren: grip-mode configuration.

;;; Commentary:

;; Basic configuration for grip-mode.

;;; Code:

(use-package grip-mode
  :general
  (:keymaps 'markdown-mode-command-map
            "g" 'grip-mode))

(provide 'siren-grip)
;;; siren-grip.el ends here
