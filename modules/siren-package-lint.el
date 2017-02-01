;;; siren-package-lint.el --- jimeh's Emacs Siren: avy configuration.

;;; Commentary:

;; Basic configuration for avy. Avy allows us to effectively navigate to visible
;; things.

;;; Code:

(siren-require-packages '(package-lint flycheck-package))

(require 'siren-flycheck)
(require 'flycheck-package)

(flycheck-package-setup)

(provide 'siren-package-lint)
;;; siren-package-lint.el ends here
