;;; siren-projectile.el --- jimeh's Emacs Siren: projectile configuration.

;;; Commentary:

;; Basic configuration for projectile.

;;; Code:

(use-package projectile
  :bind
  ("C-c p p" . projectile-switch-project)
  ("C-c C-b" . projectile-ibuffer)
  ("C-x C-t" . projectile-find-file)
  ("C-x t" . projectile-find-test-file)
  ("C-x C-v" . projectile-switch-to-buffer)

  :config
  (setq projectile-completion-system 'ido
        projectile-enable-caching nil
        projectile-globally-ignored-directories '(".idea"
                                                  ".eunit"
                                                  ".git"
                                                  ".hg"
                                                  ".fslckout"
                                                  ".bzr"
                                                  ".svn"
                                                  "_darcs"
                                                  "vendor/bundle"
                                                  "vendor/ruby"
                                                  "coverage"
                                                  "docs"
                                                  "doc"
                                                  "log"
                                                  "logs"
                                                  "tmp"
                                                  "Godeps"
                                                  "elpa"
                                                  "savefile")
        projectile-globally-ignored-files (quote ("TAGS" "*.log"))
        projectile-sort-order 'recently-active
        projectile-mode-line (quote "")
        projectile-cache-file (expand-file-name
                               "projectile.cache" siren-savefile-dir))

  ;; Treat separate directories with Gemfiles within a single git repo as separate
  ;; projects.
  (push "Gemfile" projectile-project-root-files-bottom-up)

  (projectile-global-mode t))

(provide 'siren-projectile)
;;; siren-projectile.el ends here
