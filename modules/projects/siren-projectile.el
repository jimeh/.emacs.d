;;; siren-projectile.el --- jimeh's Emacs Siren: projectile configuration.

;;; Commentary:

;; Basic configuration for projectile.

;;; Code:

(use-package projectile
  :commands
  projectile-project-root

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
  ("C-x ;" 'siren-projectile-find-file)
  ("C-x C-;" 'siren-projectile-find-file)
  (:keymaps 'projectile-mode-map
            "C-c p" 'projectile-command-map)

  :preface
  (defun siren-projectile-find-file ()
    "Find file in current project, or switch project if no root detected.

This is a replacement for `projectile-find-file' which switches
calls `projectile-switch-project' if no project root is detected.

The original `projectile-find-file' function does complete
projects if no root is detected, but it does so internally
without calling `projectile-switch-project'. This prevents some
completion systems detecting if it is completing project paths,
or file/folder paths within a project."
    (interactive)
    (if (projectile-project-root)
        (projectile-find-file)
      (projectile-switch-project)))

  :custom
  (projectile-buffers-filter-function 'projectile-buffers-with-file-or-process)
  (projectile-cache-file (siren-cache-dir "projectile"))
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
                                             "elpaca"
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


  ;; Enable projectile.
  (projectile-mode))

(provide 'siren-projectile)
;;; siren-projectile.el ends here
