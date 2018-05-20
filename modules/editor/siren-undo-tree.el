;;; siren-undo-tree.el --- jimeh's Emacs Siren: undo-tree configuration.

;;; Commentary:

;; Basic configuration for undo-tree.

;;; Code:

(use-package undo-tree
  :demand
  :bind
  ("C-x u" . undo-tree-visualize)
  ("M--" . undo-tree-undo)
  ("M-_" . undo-tree-redo)
  ("s-z" . undo-tree-undo)
  ("s-Z" . undo-tree-redo)

  :diminish
  undo-tree-mode

  :config
  (global-undo-tree-mode)
  ;; autosave the undo-tree history
  (setq undo-tree-history-directory-alist `((".*" . ,temporary-file-directory))
        undo-tree-auto-save-history t))

(provide 'siren-undo-tree)
;;; siren-undo-tree.el ends here
