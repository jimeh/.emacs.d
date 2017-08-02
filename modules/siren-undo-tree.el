;;; siren-undo-tree.el --- jimeh's Emacs Siren: undo-tree configuration.

;;; Commentary:

;; Basic configuration for undo-tree.

;;; Code:

(use-package undo-tree
  :bind
  ("C-x u" . undo-tree-visualize)
  ("M--" . undo-tree-undo)
  ("M-_" . undo-tree-redo)
  ("s-z" . undo-tree-undo)
  ("s-Z" . undo-tree-redo))

(provide 'siren-undo-tree)
;;; siren-undo-tree.el ends here
