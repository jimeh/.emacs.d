;;; siren-zoom-window.el --- jimeh's Emacs Siren: zoom-window configuration.

;;; Commentary:

;; Basic configuration for zoom-window.

;;; Code:

(siren-require-packages '(zoom-window))

(require 'zoom-window)
(global-set-key (kbd "C-x C-<return>") 'zoom-window-zoom)

(setq zoom-window-mode-line-color "#2a1f1f")

(provide 'siren-zoom-window)
;;; siren-zoom-window.el ends here
