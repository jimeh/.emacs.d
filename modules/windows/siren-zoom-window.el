;;; siren-zoom-window.el --- jimeh's Emacs Siren: zoom-window configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for zoom-window.

;;; Code:

(require 'siren-workspace-map)

(use-package zoom-window
  :general
  (:keymaps 'siren-workspace-map
            "RET" 'zoom-window-zoom
            "C-<return>" 'zoom-window-zoom)

  :config
  (with-eval-after-load 'persp-mode
    (setq zoom-window-use-persp t)
    (zoom-window-setup))

  (with-eval-after-load 'elscreen
    (setq zoom-window-use-elscreen t)
    (zoom-window-setup)))

(provide 'siren-zoom-window)
;;; siren-zoom-window.el ends here
