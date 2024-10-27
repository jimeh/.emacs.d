;;; siren-toml.el --- jimeh's Emacs Siren: toml-mode configuration.

;;; Commentary:

;; Basic configuration for toml-mode.

;;; Code:

(require 'siren-prog-mode)
(require 'siren-treesit)

(defun siren-toml-mode-setup ()
  "Default tweaks for `toml-mode'."
  (run-hooks 'prog-mode-hook)
  (setq-local tab-width 2))

(use-package conf-toml-mode
  :straight (:type built-in)
  :mode "\\.toml\\'" "Cargo\\.lock\\'"
  :hook
  (conf-toml-mode . siren-toml-mode-setup))

(if (fboundp 'toml-ts-mode)
    (use-package toml-ts-mode
      :straight (:type built-in)
      ;;; TODO: Revisit toml-ts-mode at some point the future. Performance is
      ;;; exceptionally bad on larger files of a few hundred lines.
      ;; :mode "\\.toml\\'" "Cargo\\.lock\\'"

      :hook
      (toml-ts-mode . siren-toml-mode-setup)

      :custom
      (toml-ts-mode-indent-offset 2)

      :config
      (siren-treesit-auto-ensure-grammar 'toml)))

(use-package lsp-toml
  :straight lsp-mode
  :hook
  (conf-toml-mode . siren-lsp-lua-mode-setup)
  (toml-ts-mode . siren-lsp-lua-mode-setup)

  :preface
  (defun siren-lsp-lua-mode-setup ()
    ;; Disable semantic tokens as it typically causes an annoying delay with the
    ;; syntax highlighting as you type. Essentially all new text is a very faded
    ;; out grey color for the first 1-2 seconds as you type.
    (setq-local lsp-semantic-tokens-enable nil)

    (lsp-format-buffer-on-save-mode t)
    (lsp-deferred)))

(provide 'siren-toml)
;;; siren-toml.el ends here
