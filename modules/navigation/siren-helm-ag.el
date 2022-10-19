;;; siren-helm-ag.el --- jimeh's Emacs Siren: helm-ag configuration.

;;; Commentary:

;; Basic configuration for helm-ag.

;;; Code:

(require 'siren-helm)

(use-package helm-ag
  :after (helm-global-bindings)

  :general
  ("C-x '" 'helm-do-ag-project-root)
  ("C-x C-'" 'helm-do-ag-project-root)
  (:keymaps 'helm-command-map
            "a" 'helm-do-ag)

  :custom
  (helm-ag-base-command "rg --no-heading --hidden")
  (helm-ag-command-option (string-join '("--glob !*.cjs"
                                         "--glob !*.log"
                                         "--glob !*.min-latest.css"
                                         "--glob !*.min-latest.js"
                                         "--glob !*.min.css"
                                         "--glob !*.min.js"
                                         "--glob !*.mjs"
                                         "--glob !*.sql"
                                         "--glob !*.test"
                                         "--glob !*/.log/*"
                                         "--glob !*/.yarn/*"
                                         "--glob !.bundle/*"
                                         "--glob !.git/*"
                                         "--glob !.log/*"
                                         "--glob !.vscode/*"
                                         "--glob !.yarn/*"
                                         "--glob !node_modules/*"
                                         "--glob !straight/*"
                                         "--glob !vendor/*") " "))
  (helm-ag-use-emacs-lisp-regexp nil))

(provide 'siren-helm-ag)
;;; siren-helm-ag.el ends here
