;;; siren-json.el --- jimeh's Emacs Siren: json-mode configuration.

;;; Commentary:

;; Basic configuration for json-mode.

;;; Code:

(require 'siren-js)
(require 'siren-lsp)

(use-package json-mode
  :mode "\\.json\\'"

  :general
  (:keymaps 'json-mode-map
            "C-j" 'newline-and-indent)

  :hook
  (json-mode . siren-json-mode-setup)

  :preface
  (defun siren-json-mode-setup ()
    "Default tweaks for `json-mode'."

    (let ((width 2))
      (setq-local js-indent-level width
                  json-reformat:indent-width width
                  tab-width width))))

(when (fboundp 'json-ts-mode)
  (use-package json-ts-mode
    :straight (:type built-in)
    :mode "\\.json\\'"
    :hook
    (json-ts-mode . siren-json-ts-mode-setup)

    :general
    (:keymaps 'json-ts-mode-map
              "C-j" 'newline-and-indent)

    :custom
    (json-ts-mode-indent-offset 2)

    :preface
    (defun siren-json-ts-mode-setup ()
      (setq-local json-reformat:indent-width 2))

    :config
    (require 'siren-treesit)
    (siren-treesit-auto-ensure-grammar 'json)))

(use-package lsp-json
  :straight lsp-mode

  :hook
  (json-mode . siren-lsp-json-mode-setup)
  (json-ts-mode . siren-lsp-json-mode-setup)

  :preface
  (defun siren-lsp-json-mode-setup ()
    (lsp-deferred)
    (lsp-format-buffer-on-save-mode)))

(provide 'siren-json)
;;; siren-js.el ends here
