;;; siren-package-lint.el --- jimeh's Emacs Siren: avy configuration.

;;; Commentary:

;; Basic configuration for avy. Avy allows us to effectively navigate to visible
;; things.

;;; Code:

(use-package package-lint
  :defer t
  :config
  (use-package flycheck-package
    :config (flycheck-package-setup)))

(provide 'siren-package-lint)
;;; siren-package-lint.el ends here
