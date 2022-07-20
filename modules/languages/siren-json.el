;;; siren-json.el --- jimeh's Emacs Siren: json-mode configuration.

;;; Commentary:

;; Basic configuration for json-mode.

;;; Code:

(require 'siren-js)
(require 'siren-lsp)
(require 'siren-origami)
(require 'siren-tree-sitter)

(use-package json-mode
  :mode "\\.json\\'"

  :general
  (:keymaps 'json-mode-map
            "C-j" 'newline-and-indent
            "C-c C-h" 'siren-folding-toggle)

  :hook
  (json-mode . siren-json-mode-setup)

  :preface
  (defun siren-json-mode-setup ()
    "Default tweaks for `json-mode'."

    (let ((width 2))
      (setq-local js-indent-level width
                  json-reformat:indent-width width
                  tab-width width))

    (tree-sitter-mode t)
    (origami-mode t))

  :init
  (with-eval-after-load 'origami
    (add-to-list 'origami-parser-alist
                 '(json-mode . origami-c-style-parser))))

(use-package lsp-json
  :straight lsp-mode

  :hook
  (json-mode . siren-lsp-json-mode-setup)

  :preface
  (defun siren-lsp-json-mode-setup ()
    (lsp-deferred)
    (lsp-format-buffer-on-save-mode)))

(provide 'siren-json)
;;; siren-js.el ends here
