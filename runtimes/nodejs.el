;; node.js
(setq exec-path (cons "~/.nvm/v0.10.24/bin" exec-path))
;; (setenv "PATH" (concat "~/.nvm/v0.10.24/bin:" (getenv "PATH")))


(when (require 'nvm nil 'noerror)
  (nvm-use "v0.10.24"))
