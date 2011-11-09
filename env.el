;; Homebrew
(push "/usr/local/bin" exec-path)

;; rbenv
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/shims" exec-path))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

;; node.js
(setq exec-path (cons "~/.nvm/v0.4.12/bin" exec-path))
(setenv "PATH" (concat "~/.nvm/v0.4.12/bin:" (getenv "PATH")))
