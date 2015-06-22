;;
;; Ruby setup
;;

;; rbenv
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/shims" exec-path))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

;; rbenv package - does not work >_<
;; (when (require 'rbenv nil 'noerror)
;;   (global-rbenv-mode))
