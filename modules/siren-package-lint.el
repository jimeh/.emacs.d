;;; siren-package-lint.el --- jimeh's Emacs Siren: avy configuration.

;;; Commentary:

;; Basic configuration for package-lint.

;;; Code:

(use-package package-lint
  :defer t)

(use-package flycheck-package
  :defer t
  :config
  (flycheck-package-setup))

(provide 'siren-package-lint)
;;; siren-package-lint.el ends here
