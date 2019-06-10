;;; siren-helm-ag.el --- jimeh's Emacs Siren: helm-ag configuration.

;;; Commentary:

;; Basic configuration for helm-ag.

;;; Code:

(require 'siren-helm)

(use-package helm-ag
  :bind
  ("C-c C-s" . helm-do-ag)
  ("C-x C-'" . helm-do-ag-project-root)

  :custom
  (helm-ag-ignore-patterns '("*.sql"
                             "*.test"
                             "*.min.css"
                             "*.min-latest.css"
                             "*.min.js"
                             "*.min-latest.js"
                             "archive-contents"
                             "cache"
                             "elpa"
                             "node_modules"
                             "vendor/assets")))

(provide 'siren-helm-ag)
;;; siren-helm-ag.el ends here
