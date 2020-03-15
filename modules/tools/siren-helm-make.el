;;; siren-helm-make.el --- jimeh's Emacs Siren: helm-make configuration.

;;; Commentary:

;; Basic configuration for helm-make.

;;; Code:

(require 'siren-helm)

(use-package helm-make
  :defer t
  :bind
  (:map helm-command-map
        ("m" . helm-make-projectile))

  :custom
  (helm-make-cache-targets nil)
  (helm-make-do-save t)
  (helm-make-fuzzy-matching t)
  (helm-make-list-target-method 'qp))

(provide 'siren-helm-make)
;;; siren-helm-make.el ends here
