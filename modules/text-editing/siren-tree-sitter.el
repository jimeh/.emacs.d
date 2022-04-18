;;; siren-tree-sitter.el --- jimeh's Emacs Siren: tree-sitter

;;; Commentary:

;; Configuration for tree-sitter

;;; Code:

(use-package tree-sitter
  :defer t)

(use-package tree-sitter-langs
  :hook
  (tree-sitter-after-on . tree-sitter-hl-mode)

  :config
  (tree-sitter-hl-add-patterns 'go
    ;; from: https://github.com/tree-sitter/tree-sitter-go/pull/61
    [(call_expression
      function: (identifier) @function.builtin
      (.match? @function.builtin "^(append|cap|close|complex|copy|delete|imag|len|make|new|panic|print|println|real|recover)$"))])
  )

(provide 'siren-tree-sitter)
;;; siren-tree-sitter.el ends here
