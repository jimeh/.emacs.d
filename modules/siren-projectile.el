;;; siren-projectile.el --- jimeh's Emacs Siren: projectile configuration.

;;; Commentary:

;; Basic configuration for projectile.

;;; Code:

(siren-require-packages '(projectile))

(require 'projectile)
(setq projectile-completion-system 'ido)
(setq projectile-enable-caching nil)
(setq projectile-globally-ignored-directories
      (quote (".idea"
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
              "savefile")))
(setq projectile-globally-ignored-files (quote ("TAGS" "*.log")))
(setq projectile-sort-order 'recently-active)
(setq projectile-mode-line (quote ""))
(setq projectile-cache-file (expand-file-name
                             "projectile.cache" siren-savefile-dir))

;; Treat separate directories with Gemfiles within a single git repo as separate
;; projects.
(push "Gemfile" projectile-project-root-files-bottom-up)

;; Bug lets projectile write to the file, but not read from it
;; (setq projectile-known-projects-file (expand-file-name
;;                                      "projectile-bookmarks.eld" siren-savefile-dir))

(projectile-global-mode t)

;; Keybindings
(global-set-key (kbd "C-c C-b") 'projectile-ibuffer)
(global-set-key (kbd "C-x C-t") 'projectile-find-file)
(global-set-key (kbd "C-x t") 'projectile-find-test-file)
(global-set-key (kbd "C-x C-v") 'projectile-switch-to-buffer)

(provide 'siren-projectile)
;;; siren-projectile.el ends here
