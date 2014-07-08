;; rbenv
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setq exec-path (cons "~/.rbenv/shims" exec-path))

(when (require 'rbenv nil 'noerror)
  (global-rbenv-mode))
