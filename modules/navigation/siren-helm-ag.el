;;; siren-helm-ag.el --- jimeh's Emacs Siren: helm-ag configuration.

;;; Commentary:

;; Basic configuration for helm-ag.

;;; Code:

(require 'siren-helm)

(use-package helm-ag
  :after (helm-global-bindings)
  :bind
  ("C-x '" . helm-do-ag-project-root)
  ("C-x C-'" . helm-do-ag-project-root)
  (:map helm-command-map
        ("a" . helm-do-ag))

  :custom
  (helm-ag-base-command (mapconcat 'identity
                                   '("rg" "--no-heading" "--hidden"
                                     "--glob !.git/*"
                                     "--glob !.bundle/*"
                                     "--glob !.vscode/*") " "))
  (helm-ag-use-emacs-lisp-regexp nil)
  (helm-ag-ignore-patterns '("*.min-latest.css"
                             "*.min-latest.js"
                             "*.min.css"
                             "*.min.js"
                             "*.sql"
                             "*.test"
                             "archive-contents"
                             "cache"
                             "elpa"
                             "node_modules"
                             "sorbet"
                             "straight"
                             "vendor/assets")))

(provide 'siren-helm-ag)
;;; siren-helm-ag.el ends here
