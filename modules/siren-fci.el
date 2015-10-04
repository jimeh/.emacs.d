;;
;; fci
;;

(siren-require-packages '(fill-column-indicator))

(require 'fill-column-indicator)
(setq fci-rule-width 1
      fci-handle-trucate-lines nil)


(provide 'siren-fci)