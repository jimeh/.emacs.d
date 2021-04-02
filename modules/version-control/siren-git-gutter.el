;;; siren-git-gutter.el --- jimeh's Emacs Siren: git-gutter configuration.

;;; Commentary:

;; Basic configuration for git-gutter.

;;; Code:

(use-package git-gutter
    :hook
    (prog-mode . git-gutter-mode)
    (text-mode . git-gutter-mode)

    :custom
    (git-gutter:update-interval 1)
    (git-gutter:added-sign "+")
    (git-gutter:modified-sign "=")
    (git-gutter:deleted-sign "-"))

(use-package git-gutter-fringe
  :if window-system
  :after git-gutter
  :config
  ;; Customize fringe bitmaps
  (define-fringe-bitmap 'git-gutter-fr:added
    [#b00000011] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified
    [#b00000011] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted
    [#b00000011] nil nil '(center repeated)))

(provide 'siren-git-gutter)
;;; siren-git-gutter.el ends here
