;;; siren-projectile.el --- jimeh's Emacs Siren: projectile configuration.

;;; Commentary:

;; Basic configuration for projectile.

;;; Code:

(use-package projectile
  :general
  ("C-c p p" 'projectile-switch-project)
  ("C-c p k" 'projectile-kill-buffers)
  ("C-c p r" 'projectile-replace)
  ("C-c p S" 'projectile-save-project-buffers)
  ("C-c C-b" 'projectile-ibuffer)
  ("C-c ;" 'projectile-switch-project)
  ("C-c C-;" 'projectile-switch-project)
  ("C-x C-t" 'projectile-find-file)
  ("C-x j" 'projectile-dired)
  ("C-x ;" 'projectile-find-file)
  ("C-x C-;" 'projectile-find-file)
  (:keymaps 'projectile-mode-map
            "C-c p" 'projectile-command-map)

  :custom
  (projectile-buffers-filter-function 'projectile-buffers-with-file-or-process)
  (projectile-cache-file (expand-file-name "projectile" siren-cache-dir))
  (projectile-completion-system 'default)
  (projectile-enable-caching nil)
  (projectile-globally-ignored-directories '(".bzr"
                                             ".eunit"
                                             ".extension"
                                             ".fslckout"
                                             ".git"
                                             ".hg"
                                             ".idea"
                                             ".svn"
                                             ".vagrant"
                                             "_darcs"
                                             "archive-contents"
                                             "cache"
                                             "coverage"
                                             "doc"
                                             "docs"
                                             "elpa"
                                             "log"
                                             "logs"
                                             "node_modules"
                                             "sorbet"
                                             "straight"
                                             "tmp"
                                             "vendor/assets"))
  (projectile-globally-ignored-files '("TAGS" "*.log"))
  (projectile-indexing-method 'hybrid)
  (projectile-project-search-path '("~/Projects"))
  (projectile-sort-order 'recently-active)

  :config
  (push "Gemfile" projectile-project-root-files-bottom-up)

  ;; Customize marginalia if loaded.
  (with-eval-after-load 'marginalia
    (add-to-list 'marginalia-command-categories
                 '(projectile-switch-project . file))
    (add-to-list 'marginalia-command-categories
                 '(projectile-switch-open-project . file))
    (add-to-list 'marginalia-command-categories
                 '(projectile-find-file . project-file))
    (add-to-list 'marginalia-command-categories
                 '(projectile-recentf . project-file))
    (add-to-list 'marginalia-command-categories
                 '(projectile-display-buffer . project-buffer))
    (add-to-list 'marginalia-command-categories
                 '(projectile-switch-to-buffer . project-buffer)))

  ;; Enable projectile.
  (projectile-mode))

(provide 'siren-projectile)
;;; siren-projectile.el ends here
