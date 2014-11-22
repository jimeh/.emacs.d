;;
;; Node.js setup
;;

;; nvm
(when (and
       (file-directory-p (expand-file-name "~/.nvm"))
       (require 'nvm nil 'noerror))
  (nvm-use "v0.10.24"))
