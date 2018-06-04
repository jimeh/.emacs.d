;;; siren-projectile.el --- jimeh's Emacs Siren: projectile configuration.

;;; Commentary:

;; Basic configuration for projectile.

;;; Code:

(use-package projectile
  :bind
  ("C-c p p" . projectile-switch-project)
  ("C-c C-b" . projectile-ibuffer)
  ("C-c C-k" . projectile-kill-buffers)
  ("C-x C-t" . projectile-find-file)
  ("C-x t" . projectile-find-test-file)
  ("C-x C-v" . projectile-switch-to-buffer)

  :init
  (setq projectile-cache-file (expand-file-name
                               "projectile.cache" siren-savefile-dir))

  (setq projectile-completion-system 'ido
        projectile-enable-caching nil
        projectile-globally-ignored-directories '(".bzr"
                                                  ".eunit"
                                                  ".fslckout"
                                                  ".git"
                                                  ".hg"
                                                  ".idea"
                                                  ".svn"
                                                  ".vagrant"
                                                  "Godeps"
                                                  "_darcs"
                                                  "coverage"
                                                  "doc"
                                                  "docs"
                                                  "elpa"
                                                  "log"
                                                  "logs"
                                                  "savefile"
                                                  "tmp"
                                                  "vendor/bundle"
                                                  "vendor/ruby")
        projectile-globally-ignored-files '("TAGS" "*.log")
        projectile-sort-order 'recently-active
        projectile-mode-line (quote ""))

  :config
  ;; Treat separate directories with Gemfiles within a single git repo as separate
  ;; projects.
  (push "Gemfile" projectile-project-root-files-bottom-up)

  (projectile-global-mode t))

(provide 'siren-projectile)
;;; siren-projectile.el ends here
