;;; siren-swiper.el --- jimeh's Emacs Siren: swiper configuration.

;;; Commentary:

;; Basic configuration for swiper.

;;; Code:

(use-package swiper
  :bind
  ("C-s" . swiper)
  ("C-c C-r" . ivy-resume)

  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)

  (custom-set-faces
   '(ivy-current-match ((t (:background "#7e9fc9" :foreground "black"))))
   '(swiper-line-face ((t (:background "#313c4d"))))))

(provide 'siren-swiper)
;;; siren-swiper.el ends here
