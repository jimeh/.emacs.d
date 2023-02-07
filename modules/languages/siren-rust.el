;;; siren-rust.el --- jimeh's Emacs Siren: rust-mode configuration.

;;; Commentary:

;; Basic configuration for rust-mode.

;;; Code:

(require 'siren-lsp)

(use-package rust-mode
  :mode "\\.rs\\'"
  :interpreter "rust"
  :commands rust-mode
  :general
  (:keymaps 'rust-mode-map
            "RET" 'newline-and-indent)

  :hook
  (rust-mode . siren-rust-mode-setup)

  :preface
  (defun siren-rust-mode-setup ()
    (setq-local rust-format-on-save t)))

(use-package lsp-rust
  :straight lsp-mode

  :hook
  (rust-mode . siren-lsp-rust-mode-setup)

  :preface
  (defun siren-lsp-rust-mode-setup ()
    (lsp-format-buffer-on-save-mode t)
    (lsp)

    ;; Disable semantic tokens as it typically causes an annoying delay with the
    ;; syntax highlighting as you type. Essentially all new text is a very faded
    ;; out grey color for the first 1-2 seconds as you type.
    (lsp-semantic-tokens-mode -1))

   ;; Fixes for eldoc, see:
   ;; - https://github.com/emacs-lsp/lsp-mode/pull/1740
   ;; - https://github.com/scturtle/dotfiles/blob/b7fdc06ca4ef4fd60170ac4ef57e3d1c9cf9a498/doom_emacs/.doom.d/config.el#L62-L77

   ;; extract and show short signature for rust-analyzer
   (cl-defmethod lsp-clients-extract-signature-on-hover (contents (_server-id (eql rust-analyzer)))
     (let* ((value (if lsp-use-plists (plist-get contents :value) (gethash "value" contents)))
            (groups (--partition-by (s-blank? it) (s-lines (s-trim value))))
            (sig_group (if (s-equals? "```rust" (car (-third-item groups)))
                           (-third-item groups)
                         (car groups)))
            (sig (--> sig_group
                      (--drop-while (s-equals? "```rust" it) it)
                      (--take-while (not (s-equals? "```" it)) it)
                      (--map (s-trim it) it)
                      (s-join " " it))))
       (lsp--render-element (concat "```rust\n" sig "\n```"))))

   ;; do not cache the shitty result from rust-analyzer
   (advice-add #'lsp-eldoc-function :after (lambda (&rest _) (setq lsp--hover-saved-bounds nil))))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode)
  :general
  (:keymaps 'rust-mode-map
            "C-c , a" 'cargo-process-test))

(use-package cargo-transient
  :general
  (:keymaps 'rust-mode-map
            "C-'" 'cargo-transient
            "C-c C-," 'cargo-transient)

  :custom
  (cargo-transient-compilation-buffer-name-function
   'cargo-transient-project-prefixed-buffer-name))

(use-package flycheck-rust
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package rust-playground
  :defer t
  :general
  (:keymaps 'rust-playground-mode-map
            "C-<return>" 'rust-playground-exec)
  :custom
  (rust-playground-basedir (expand-file-name "~/.rust/playground")))

(provide 'siren-rust)
;;; siren-rust.el ends here
