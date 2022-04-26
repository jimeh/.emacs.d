;;; siren-forge.el --- jimeh's Emacs Siren: forge configuration

;;; Commentary:

;; Basic configuration for forge.

;;; Code:

(require 'siren-code-review)
(require 'siren-gh-notify)
(require 'siren-github-review)
(require 'siren-magit)

(use-package forge
  :defer t
  :after magit

  :custom
  (forge-database-file (siren-cache-dir "forge-database.sqlite"))

  :config
  (transient-insert-suffix 'forge-dispatch '(1)
    ["Pull Request"
     ("p c" "code-review at point" code-review-forge-pr-at-point)
     ("p g" "github-review at point" github-review-forge-pr-at-point)])
  (transient-insert-suffix 'forge-dispatch '(1)
    ["GitHub"
     ("g n" "notifications" gh-notify)]))

(use-package forge-post
  :straight forge
  :defer t

  :hook
  (forge-post-mode . siren-forge-post-mode-setup)

  :preface
  (defun siren-forge-post-mode-setup ()
    (setq-local prettier-js-args '("--parser" "markdown"
                                   "--print-width" "80"
                                   "--prose-wrap" "always"))))

(provide 'siren-forge)
;;; siren-forge.el ends here
