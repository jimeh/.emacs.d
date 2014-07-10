;; rbenv
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setq exec-path (cons "~/.rbenv/shims" exec-path))

(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

;; (when (require 'rbenv nil 'noerror)
;;   (global-rbenv-mode))
