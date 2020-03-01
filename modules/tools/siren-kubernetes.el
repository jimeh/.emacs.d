;;; siren-kubernetes.el --- jimeh's Emacs Siren: kubernetes configuration.

;;; Commentary:

;; Basic configuration for kubernetes.

;;; Code:

(use-package kubernetes
  :defer t

  :init
  (defalias 'ko 'kubernetes-overview))

(provide 'siren-kubernetes)
;;; siren-kubernetes.el ends here
