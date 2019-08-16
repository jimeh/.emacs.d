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
  ("C-c C-k" . projectile-kill-buffers)
  ("C-x C-t" . projectile-find-file)
  ("C-x t" . projectile-find-test-file)
  ("C-x C-v" . projectile-switch-to-buffer)
  (:map projectile-mode-map
        ("C-c p" . projectile-command-map))

  :custom
  (projectile-cache-file (expand-file-name "projectile" siren-cache-dir))
  (projectile-completion-system 'ido)
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
                                             "node_modules"
                                             "log"
                                             "logs"
                                             "tmp"
                                             "vendor/assets"))
  (projectile-globally-ignored-files '("TAGS" "*.log"))
  (projectile-indexing-method 'hybrid)
  (projectile-sort-order 'recently-active)

  :config
  ;; Treat separate directories with Gemfiles within a single git repo as separate
  ;; projects.
  (push "Gemfile" projectile-project-root-files-bottom-up)

  (projectile-mode t))

(provide 'siren-projectile)
;;; siren-projectile.el ends here
