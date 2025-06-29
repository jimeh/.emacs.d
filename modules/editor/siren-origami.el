;;; siren-origami.el --- jimeh's Emacs Siren: origami configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for origami code.

;;; Code:

(use-package origami
  :general
  (:keymaps 'origami-mode-map
            "M-0" 'origami-open-all-nodes
            "M-9" 'origami-close-all-nodes
            "C-=" 'origami-forward-toggle-node
            "C-c C-h" 'origami-forward-toggle-node)

  :hook
  ((dart-mode
    go-mode
    go-ts-mode
    js-mode
    js-ts-mode
    json-mode
    json-ts-mode
    php-mode
    protobuf-mode
    rjsx-mode
    rust-mode
    rust-ts-mode
    typescript-mode) . siren-origami-mode-enable)

  :preface
  (defun siren-origami-mode-enable ()
    (origami-mode t))

  :config
  (dolist (item '((dart-mode . origami-c-style-parser)
                  (json-mode . origami-c-style-parser)
                  (json-ts-mode . origami-c-style-parser)
                  (protobuf-mode . origami-c-style-parser)
                  (rjsx-mode . origami-c-style-parser)
                  (rust-mode . origami-c-style-parser)
                  (rust-ts-mode . origami-c-style-parser)
                  (typescript-mode . origami-c-style-parser)
                  (typescript-ts-mode . origami-c-style-parser)))
    (add-to-list 'origami-parser-alist item)))

(use-package lsp-origami
  :after lsp-mode)

(provide 'siren-origami)
;;; siren-origami.el ends here
