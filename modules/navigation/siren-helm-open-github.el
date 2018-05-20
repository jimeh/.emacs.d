;;; siren-helm-open-github.el --- jimeh's Emacs Siren: helm-open-github configuration.

;;; Commentary:

;; Basic configuration for helm-open-github.

;;; Code:

(require 'siren-helm)

(use-package helm-open-github
  :bind
  ("C-c o f" . helm-open-github-from-file)
  ("C-c o c" . helm-open-github-from-commit)
  ("C-c o i" . helm-open-github-from-issues)
  ("C-c o p" . helm-open-github-from-pull-requests)

  :config
  (setq helm-open-github-commit-limit 10000))

(provide 'siren-helm-open-github)
;;; siren-helm-open-github.el ends here
