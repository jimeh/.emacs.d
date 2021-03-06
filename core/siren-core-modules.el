;;; siren-core-modules.el --- jimeh's Emacs Siren: Module loading.

;;; Commentary:

;; Load the modules!

;;; Code:

(defvar siren-modules-dir (expand-file-name "modules" siren-dir)
  "Root directory for Emacs Siren modules.")
(siren-recursive-add-to-load-path siren-modules-dir)

;; Core
(require 'siren-aliases)
(require 'siren-global-keybindings)
(require 'siren-packages)

;; Theme
(require 'siren-doom-themes)

;; Completion
(require 'siren-company)

;; Documentation
(require 'siren-dash-at-point)
(require 'siren-helpful)

;; Editor
(require 'siren-amx)
(require 'siren-highlight-symbol)
(require 'siren-display-fill-column)
(require 'siren-display-indentation)
(require 'siren-display-line-numbers)
(require 'siren-folding)
(require 'siren-ido)
(require 'siren-minions)
(require 'siren-mwim)
(require 'siren-rainbow)
(require 'siren-undo-tree)
(require 'siren-undohist)
(require 'siren-which-key)

;; Linting
(require 'siren-flycheck)

;; Misc.
(require 'siren-explain-pause)
(require 'siren-grip)
(require 'siren-rand)
(require 'siren-restart-emacs)
(require 'siren-uuidgen)
(require 'siren-zone)

;; Navigation
(require 'siren-anzu)
(require 'siren-avy)
(require 'siren-centaur-tabs)
(require 'siren-dired)
(require 'siren-direx)
(require 'siren-dumb-jump)
(require 'siren-git-link)
(require 'siren-helm)
(require 'siren-helm-ag)
(require 'siren-helm-swoop)
(require 'siren-imenu)
(require 'siren-recursive-narrow)
(require 'siren-scroll-half-screen)

;; Project management
(require 'siren-editorconfig)
(require 'siren-helm-projectile)
(require 'siren-projectile)
(require 'siren-treemacs)

;; Language Servers
(require 'siren-lsp)
(require 'siren-lsp-ui)
(require 'siren-helm-lsp)

;; Debugging
(require 'siren-dap)

;; Shell
(require 'siren-shell-pop)

;; Spelling
(require 'siren-flyspell)

;; Text editing
(require 'siren-expand-region)
(require 'siren-goto-chg)
(require 'siren-move-dup)
(require 'siren-multiple-cursors)
(require 'siren-randomize-region)
(require 'siren-safe-change-case)
(require 'siren-smart-shift)
(require 'siren-smartparens)
(require 'siren-sort-symbols)
(require 'siren-sort-words)
(require 'siren-string-edit)
(require 'siren-string-inflection)
(require 'siren-toggle-comments)
(require 'siren-toggle-quotes)
(require 'siren-yasnippet)

;; Version control
(require 'siren-diff-hl)
(require 'siren-ediff)
(require 'siren-forge)
(require 'siren-git-timemachine)
(require 'siren-github)
(require 'siren-magit)

;; Window management
(require 'siren-resize-window)
(require 'siren-windmove)
(require 'siren-zoom-window)

;; Workspace management
(require 'siren-tab-bar)
(require 'siren-desktop)

;; Org-mode
(require 'siren-htmlize)
(require 'siren-ob-http)
(require 'siren-ob-mermaid)
(require 'siren-org-mode)
(require 'siren-ox-gfm)
(require 'siren-ox-pandoc)

;; Tools
(require 'siren-docker)
(require 'siren-helm-make)
(require 'siren-httprepl)
(require 'siren-kubernetes)
(require 'siren-restclient)

;; XWidgets
(require 'siren-xwidget-plus)

;; Major modes
(require 'siren-fundamental-mode)
(require 'siren-prog-mode)
(require 'siren-special-mode)
(require 'siren-text-mode)

;; Languages
(require 'siren-applescript)
(require 'siren-caddyfile)
(require 'siren-coffee)
(require 'siren-conf)
(require 'siren-css)
(require 'siren-cucumber)
(require 'siren-dart)
(require 'siren-dockerfile)
(require 'siren-emacs-lisp)
(require 'siren-flutter)
(require 'siren-gitconfig)
(require 'siren-gitignore)
(require 'siren-golang)
(require 'siren-groovy)
(require 'siren-haml)
(require 'siren-haskell)
(require 'siren-jinja2)
(require 'siren-js)
(require 'siren-json)
(require 'siren-jsonnet)
(require 'siren-jsx)
(require 'siren-lisp)
(require 'siren-lua)
(require 'siren-makefile)
(require 'siren-markdown)
(require 'siren-mermaid)
(require 'siren-nginx)
(require 'siren-php)
(require 'siren-plantuml)
(require 'siren-ruby)
(require 'siren-rust)
(require 'siren-sass)
(require 'siren-scss)
(require 'siren-sh)
(require 'siren-slim)
(require 'siren-sql)
(require 'siren-terraform)
(require 'siren-thrift)
(require 'siren-toml)
(require 'siren-typescript)
(require 'siren-vue)
(require 'siren-web-mode)
(require 'siren-xml)
(require 'siren-yaml)

(provide 'siren-core-modules)
;;; siren-core-modules.el ends here
