;;; siren-dockerfile.el --- jimeh's Emacs Siren: dockerfile-mode configuration.

;;; Commentary:

;; Basic configuration for dockerfile-mode.

;;; Code:

(use-package dockerfile-mode
  :mode "/Dockerfile\\'" "/Dockerfile\\..+\\'"
  :hook (dockerfile-mode . siren-dockerfile-mode-setup)

  :init
  (defun siren-dockerfile-mode-setup ()
    (subword-mode +1)))

(provide 'siren-dockerfile)
;;; siren-dockerfile.el ends here
