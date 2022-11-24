;;; siren-yaml.el --- jimeh's Emacs Siren: yaml-mode configuration.

;;; Commentary:

;; Basic configuration for yaml-mode.

;;; Code:

(require 'siren-lsp)
(require 'siren-prog-mode)
(require 'siren-tree-sitter)

(use-package yaml-mode
  :mode "\\.yml\\'" "\\.yaml\\'"
  :general
  (:keyamps 'yaml-mode-map
            "RET" 'newline-and-indent)

  :hook
  (yaml-mode . siren-yaml-mode-setup)

  :preface
  ;; Manually set full tree-sitter highlight queries for yaml-mode. This is a
  ;; temporary workaround until this PR is merged:
  ;; https://github.com/emacs-tree-sitter/tree-sitter-langs/pull/134
  (defun siren-yaml-mode-tree-sitter-setup ()
    (setq-local tree-sitter-hl-default-patterns
                [;; keys
                 (block_mapping_pair
                  key: (flow_node [(double_quote_scalar) (single_quote_scalar)] @variable))
                 (block_mapping_pair
                  key: (flow_node (plain_scalar (string_scalar) @variable)))

                 ;; keys within inline {} blocks
                 (flow_mapping
                  (_ key: (flow_node [(double_quote_scalar) (single_quote_scalar)] @variable)))
                 (flow_mapping
                  (_ key: (flow_node (plain_scalar (string_scalar) @variable))))

                 ["[" "]" "{" "}"] @punctuation.bracket
                 ["," "-" ":" "?" ">" "|"] @punctuation.delimiter
                 ["*" "&" "---" "..."] @punctuation.special

                 [(null_scalar) (boolean_scalar)] @constant.builtin
                 [(integer_scalar) (float_scalar)] @number
                 [(double_quote_scalar) (single_quote_scalar) (block_scalar)] @string
                 (escape_sequence) @escape

                 (comment) @comment
                 [(anchor_name) (alias_name)] @function
                 (yaml_directive) @type

                 (tag) @type
                 (tag_handle) @type
                 (tag_prefix) @string
                 (tag_directive) @property ]))

  (defun siren-yaml-mode-setup ()
    (run-hooks 'prog-mode-hook)

    (setq-local tab-width 2)
    (siren-yaml-mode-tree-sitter-setup)
    (tree-sitter-mode t)
    (subword-mode t)))

(use-package lsp-yaml
  :straight lsp-mode

  :hook
  (yaml-mode . siren-lsp-yaml-mode-setup)

  :preface
  (defun siren-lsp-yaml-mode-setup ()
    (lsp-deferred)
    (lsp-format-buffer-on-save-mode)))

(use-package yaml-imenu
  :after yaml-mode
  :config
  (yaml-imenu-enable))

(provide 'siren-yaml)
;;; siren-yaml.el ends here
