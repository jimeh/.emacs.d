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
      ;; TODO: Revisit toml-ts-mode at some point the future. It's a bit buggy
      ;; at the moment.
      :mode "\\.toml\\'" "Cargo\\.lock\\'"

      :hook
      (toml-ts-mode . siren-toml-mode-setup)

      :custom
      (toml-ts-mode-indent-offset 2)

      :config
      (siren-treesit-auto-ensure-grammar 'toml)))

(use-package lsp-toml
  :straight lsp-mode
  :hook
  (toml-mode . siren-lsp-lua-mode-setup)
  (toml-ts-mode . siren-lsp-lua-mode-setup)

  :preface
  (defun siren-lsp-lua-mode-setup ()
    (lsp-format-buffer-on-save-mode t)
    (lsp-deferred))
)

(provide 'siren-toml)
;;; siren-toml.el ends here
