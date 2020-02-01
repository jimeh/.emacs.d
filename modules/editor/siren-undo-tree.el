;;; siren-undo-tree.el --- jimeh's Emacs Siren: undo-tree configuration.

;;; Commentary:

;; Basic configuration for undo-tree.

;;; Code:

(use-package undo-tree
  :hook
  (after-init . global-undo-tree-mode)

  :bind
  ("C-x u" . undo-tree-visualize)
  ("M--" . undo-tree-undo)
  ("M-_" . undo-tree-redo)
  ("s-z" . undo-tree-undo)
  ("s-Z" . undo-tree-redo)

  :diminish
  undo-tree-mode

  :custom
  ;; autosave the undo-tree history
  (undo-tree-history-directory-alist
   `((".*" . ,(expand-file-name "undo-tree-history" siren-cache-dir))))
  (undo-tree-auto-save-history nil))

(provide 'siren-undo-tree)
;;; siren-undo-tree.el ends here
