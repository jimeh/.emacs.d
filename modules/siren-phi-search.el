;;
;; phi-search
;;

(siren-require-packages '(phi-search))

(require 'phi-search)
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)


(provide 'siren-phi-search)