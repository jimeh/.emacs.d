;;
;; Node.js setup
;;

;; node.js
(setq exec-path (cons "~/.nvm/v0.12.4/bin" exec-path))
(setenv "PATH" (concat "~/.nvm/v0.12.4/bin:" (getenv "PATH")))

;; ;; nvm package - does not work >_<
;; (when (require 'nvm nil 'noerror)
;;  (setq nvm-dir (expand-file-name "~/.nvm/versions/node"))
;;  (when (file-directory-p nvm-dir)
;;    (nvm-use "v0.10.24")))
