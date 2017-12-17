;;; siren-helm.el --- jimeh's Emacs Siren: helm configuration.

;;; Commentary:

;; Basic configuration for helm.

;;; Code:

(use-package helm
  :defer t
  :config
  (setq helm-autoresize-mode 1))

(use-package helm-descbinds
  :defer t)

(use-package helm-describe-modes
  :defer t)

(provide 'siren-helm)
;;; siren-helm.el ends here
