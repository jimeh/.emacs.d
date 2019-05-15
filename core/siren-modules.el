;;; siren-modules.el --- jimeh's Emacs Siren: Module loading.

;;; Commentary:

;; Load the modules!

;;; Code:

(setq siren-modules-dir (expand-file-name "modules" siren-dir))
(add-to-list 'load-path siren-modules-dir)
(siren-add-subfolders-to-load-path siren-modules-dir)

;; Core
(require 'siren-aliases)
(require 'siren-global-keybindings)
(require 'siren-packages)

;; Completion
(require 'siren-company)

;; Debugging
(require 'siren-realgud)

;; Documentation
(require 'siren-dash-at-point)

;; Editor
(require 'siren-browse-kill-ring)
(require 'siren-evil)
(require 'siren-helm-command)
(require 'siren-ido)
(require 'siren-linum)
(require 'siren-linum-relative)
(require 'siren-rainbow)
(require 'siren-smex)
(require 'siren-undo-tree)
(require 'siren-which-key)

;; Help
(require 'siren-helpful)

;; Linting
(require 'siren-flycheck)

;; Misc.
(require 'siren-restart-emacs)
(require 'siren-zone)

;; Navigation
(require 'siren-anzu)
(require 'siren-avy)
(require 'siren-dired)
(require 'siren-direx)
(require 'siren-dumb-jump)
(require 'siren-folding)
(require 'siren-full-ack)
(require 'siren-git-link)
(require 'siren-helm)
(require 'siren-helm-ag)
(require 'siren-helm-files)
(require 'siren-helm-gtags)
(require 'siren-helm-imenu)
(require 'siren-helm-open-github)
(require 'siren-helm-swoop)
(require 'siren-move-beginning-of-line)
(require 'siren-scroll-half-screen)
;; (require 'siren-goto-symbol)

;; Project management
(require 'siren-editorconfig)
(require 'siren-helm-projectile)
(require 'siren-neotree)
(require 'siren-projectile)

;; Language Servers
(require 'siren-lsp)
(require 'siren-lsp-ui)
(require 'siren-company-lsp)
(require 'siren-helm-lsp)

;; Spelling
(require 'siren-flyspell)

;; Text editing
(require 'siren-expand-region)
(require 'siren-goto-chg)
(require 'siren-move-dup)
(require 'siren-multiple-cursors)
(require 'siren-randomize-region)
(require 'siren-shift-text)
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
;; (require 'siren-magithub)

;; Window management
(require 'siren-buffer-move)
(require 'siren-resize-window)
(require 'siren-windmove)
(require 'siren-zoom-window)

;; Workspace management
(require 'siren-escreen)

;; Org-mode
(require 'siren-htmlize)
(require 'siren-org-mode)
(require 'siren-org-mouse)
(require 'siren-ox-jira)

;; Languages
(require 'siren-coffee)
(require 'siren-conf)
(require 'siren-css)
(require 'siren-cucumber)
(require 'siren-dockerfile)
(require 'siren-emacs-lisp)
(require 'siren-gitconfig)
(require 'siren-gitignore)
(require 'siren-golang)
(require 'siren-groovy)
(require 'siren-haml)
(require 'siren-js)
(require 'siren-json)
(require 'siren-jsx)
(require 'siren-lua)
(require 'siren-makefile)
(require 'siren-markdown)
(require 'siren-php)
(require 'siren-plantuml)
(require 'siren-prog-mode)
(require 'siren-ruby)
(require 'siren-rust)
(require 'siren-sass)
(require 'siren-scss)
(require 'siren-sh)
(require 'siren-slim)
(require 'siren-sql)
(require 'siren-text-mode)
(require 'siren-thrift)
(require 'siren-typescript)
(require 'siren-web-mode)
(require 'siren-yaml)

(provide 'siren-modules)
;;; siren-modules.el ends here
