;;; siren-packages.el --- jimeh's Emacs Siren: avy configuration.

;;; Commentary:

;; Basic configuration for packages.

;;; Code:

(require 'siren-flycheck)

(use-package package-lint
  :defer t)

(use-package package-build
  :defer t)

(use-package flycheck-package
  :defer t
  :config
  (flycheck-package-setup))

(provide 'siren-packages)
;;; siren-packages.el ends here
