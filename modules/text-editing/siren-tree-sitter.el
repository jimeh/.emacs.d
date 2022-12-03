;;; siren-tree-sitter.el --- jimeh's Emacs Siren: tree-sitter

;;; Commentary:

;; Configuration for tree-sitter

;;; Code:

(use-package tree-sitter
  :hook
  ((css-mode
    js-mode
    json-mode
    php-mode
    ruby-mode
    rust-mode
    sh-mode
    terraform-mode
    typescript-mode
    yaml-mode) . siren-tree-sitter-mode-enable)

  :preface
  (defun siren-tree-sitter-mode-enable ()
    (tree-sitter-mode t))

  :defer t)

(use-package tree-sitter-langs
  :hook
  (tree-sitter-after-on . tree-sitter-hl-mode))

(provide 'siren-tree-sitter)
;;; siren-tree-sitter.el ends here
