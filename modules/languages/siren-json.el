;;; siren-json.el --- jimeh's Emacs Siren: json-mode configuration.

;;; Commentary:

;; Basic configuration for json-mode.

;;; Code:

(require 'siren-folding)
(require 'siren-js)
(require 'siren-lsp)
(require 'siren-tree-sitter)

(use-package json-mode
  :mode "\\.json\\'"

  :general
  (:keymaps 'json-mode-map
            "C-j" 'newline-and-indent
            "C-c C-h" 'siren-folding-toggle)

  :hook
  (json-mode . siren-json-mode-setup)

  :init
  (defun siren-json-mode-setup ()
    "Default tweaks for `json-mode'."

    (let ((width 2))
      (setq js-indent-level width
            json-reformat:indent-width width
            tab-width width))

    (tree-sitter-mode +1)))

(use-package lsp-json
  :straight lsp-mode

  :hook
  (json-mode . siren-lsp-json-mode-setup)

  :init
  (defun siren-lsp-json-mode-setup ()
    (lsp-deferred)
    (lsp-format-buffer-on-save-mode)))

(provide 'siren-json)
;;; siren-js.el ends here
