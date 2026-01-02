;;; siren-rust.el --- jimeh's Emacs Siren: rust-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for rust-mode.

;;; Code:

(require 'siren-flycheck)
(require 'siren-lsp)
(require 'siren-treesit)

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

(when (fboundp 'rust-ts-mode)
  (use-package rust-ts-mode
    :ensure nil
    :mode "\\.rs\\'"
    :interpreter "rust"
    :hook
    (rust-ts-mode . siren-rust-ts-mode-setup)

    :general
    (:keymaps 'rust-ts-mode-map
              "C-j" 'newline-and-indent)

    :custom
    (rust-ts-mode-indent-offset 4)

    :preface
    (defun siren-rust-ts-mode-setup ())

    :config
    (siren-treesit-auto-ensure-grammar 'rust)))

(use-package lsp-rust
  :ensure nil
  :defer t

  :hook
  (rust-mode . siren-lsp-rust-mode-setup)
  (rust-ts-mode . siren-lsp-rust-mode-setup)

  :preface
  (defun siren-lsp-rust-mode-setup ()
    ;; Disable semantic tokens as it typically causes an annoying delay with the
    ;; syntax highlighting as you type. Essentially all new text is a very faded
    ;; out grey color for the first 1-2 seconds as you type.
    (setq-local lsp-semantic-tokens-enable nil)

    (lsp-format-buffer-on-save-mode t)
    (lsp-deferred))

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
  :hook
  (rust-mode . cargo-minor-mode)
  (rust-ts-mode . cargo-minor-mode)

  :general
  (:keymaps '(rust-mode-map rust-ts-mode-map)
            "C-c , a" 'cargo-process-test
            "C-c , s" 'cargo-process-current-test
            "C-c , v" 'cargo-process-current-file-tests)

  :custom
  (cargo-process--command-test--additional-args "-- --nocapture")

  :preface
  (defun siren-cargo-process--get-current-mod-path ()
    "Get the current module name."
    (let ((filename (buffer-file-name)))
      (when (and filename
                 (string-match "/\\(src\\|tests\\)/\\(.*\\)\\.rs$" filename))
        (let ((path (match-string 2 filename)))
          (unless (member path '("" "lib" "main"))
            (let ((mod (replace-regexp-in-string
                        "-" "_" (string-remove-suffix "/mod" path))))
              (when mod (replace-regexp-in-string "/" "::" mod))))))))

  (defun siren-cargo-process--get-current-mod-advice (orig-fun &rest args)
    "Get the current module name."
    (let ((path (siren-cargo-process--get-current-mod-path))
          (mod (apply orig-fun args)))
      (cond ((and path mod) (concat path "::" mod))
            (path path)
            (t mod))))

  :config
  (advice-add 'cargo-process--get-current-mod
              :around 'siren-cargo-process--get-current-mod-advice))

(use-package cargo-transient
  :general
  (:keymaps '(rust-mode-map rust-ts-mode-map)
            "C-c C-," 'cargo-transient)

  :custom
  (cargo-transient-compilation-buffer-name-function
   'cargo-transient-project-prefixed-buffer-name))

(use-package flycheck-rust
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
