;;; siren-tree-sitter.el --- jimeh's Emacs Siren: tree-sitter

;;; Commentary:

;; Configuration for tree-sitter

;;; Code:

(use-package tree-sitter
  :defer t)

(use-package tree-sitter-langs
  :hook
  (tree-sitter-after-on . tree-sitter-hl-mode))

(provide 'siren-tree-sitter)
;;; siren-tree-sitter.el ends here
