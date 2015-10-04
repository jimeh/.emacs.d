;;
;; flycheck
;;

(siren-require-packages '(flycheck))

(require 'flycheck)
(setq flycheck-completion-system 'ido)
(setq flycheck-idle-change-delay 1.0)
(setq flycheck-indication-mode 'right-fringe)


(provide 'siren-flycheck)
