;;; siren-projectile.el --- jimeh's Emacs Siren: projectile configuration.

;;; Commentary:

;; Basic configuration for projectile.

;;; Code:

(use-package projectile
  :bind
  ("C-c p p" . projectile-switch-project)
  ("C-c p k" . projectile-kill-buffers)
  ("C-c p r" . projectile-replace)
  ("C-c p S" . projectile-save-project-buffers)
  ("C-c C-b" . projectile-ibuffer)
  ("C-c b" . projectile-switch-to-buffer)
  ("C-x C-t" . projectile-find-file)

  (:map projectile-mode-map
        ("C-c p" . projectile-command-map))

  :custom
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
  (push "Rakefile" projectile-project-root-files)
  ;; Treat separate directories with Gemfiles within a single git repo as
  ;; separate projects.
  (push "Gemfile" projectile-project-root-files-bottom-up)

  (projectile-mode))

(provide 'siren-projectile)
;;; siren-projectile.el ends here
