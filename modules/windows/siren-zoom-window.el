;;; siren-zoom-window.el --- jimeh's Emacs Siren: zoom-window configuration.

;;; Commentary:

;; Basic configuration for zoom-window.

;;; Code:

(use-package zoom-window
  :bind
  ("C-x C-<return>" . zoom-window-zoom)
  ("C-z <return>" . zoom-window-zoom)
  ("C-z C-<return>" . zoom-window-zoom)

  :init
  ;; Allow C-z to be used as a key prefix.
  (global-set-key (kbd "C-z") nil)

  :config
  (with-eval-after-load "persp-mode"
    (setq zoom-window-use-persp t)
    (zoom-window-setup))

  (with-eval-after-load "elscreen"
    (setq zoom-window-use-elscreen t)
    (zoom-window-setup)))

(provide 'siren-zoom-window)
;;; siren-zoom-window.el ends here
