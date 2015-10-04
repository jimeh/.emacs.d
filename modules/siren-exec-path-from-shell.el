;;
;; exec-path-from-shell
;;

(siren-require-packages '(exec-path-from-shell))

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

(provide 'siren-exec-path-from-shell)
