;;
;; highlight-symbol
;;

(siren-require-packages '(highlight-symbol))

(require 'highlight-symbol)

(setq highlight-symbol-highlight-single-occurrence 'nil)
(setq highlight-symbol-idle-delay 0.5)

(global-set-key (kbd "C-c C-p") 'highlight-symbol-prev)
(global-set-key (kbd "C-c C-n") 'highlight-symbol-next)


(provide 'siren-highlight-symbol)
