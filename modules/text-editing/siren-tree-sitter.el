;;; siren-tree-sitter.el --- jimeh's Emacs Siren: tree-sitter  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Configuration for tree-sitter

;;; Code:

(use-package tree-sitter
  :hook
  ((css-mode
    go-mode
    js-mode
    json-mode
    lua-mode
    nix-mode
    php-mode
    php-mode
    python-mode
    ruby-mode
    rust-mode
    ;; terraform-mode ;; Disabled due to frequently locking up Emacs for minutes
    typescript-mode
    yaml-mode) . siren-tree-sitter-mode-enable)

  :preface
  (defgroup siren-tree-sitter nil
    "Siren specific tweaks to tree-sitter-mode."
    :group 'tree-sitter)

  (defcustom siren-tree-sitter-incompatible-modes '(scss-mode)
    "List of modes where tree-sitter-mode should not be enabled."
    :type 'boolean
    :group 'siren-tree-sitter)

  (defun siren-tree-sitter-mode-enable ()
    "Enable tree-sitter-mode if the current major mode is not in the banned list."
    (unless (derived-mode-p siren-tree-sitter-incompatible-modes)
      (tree-sitter-mode t))))

(use-package tree-sitter-langs
  :hook
  (tree-sitter-after-on . tree-sitter-hl-mode))

(provide 'siren-tree-sitter)
;;; siren-tree-sitter.el ends here
