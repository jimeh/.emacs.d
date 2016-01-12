;;
;; ecb
;;

(siren-require-packages '(ecb))

(require 'ecb)

(setq ecb-layout-name "left13")
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(setq ecb-tree-make-parent-node-sticky nil)
(setq ecb-prescan-directories-for-emptyness nil)
(setq ecb-tip-of-the-day nil)
(setq ecb-tree-indent 3)
(setq ecb-windows-width 0.24)
(setq ecb-source-path
   (quote
    (("~/Projects" "Projects")
     ("~/.emacs.d" ".emacs.d")
     ("~/.dotfiles" ".dotfiles")
     ("~/Projects/which" "which")
     ("~/Projects/fitzdares" "fitzdares")
     ("~/.go" ".go")
     ("~/src" "src")
     ("~/Sites" "Sites")
     ("~" "~")
     ("/" "/"))))

(if window-system (ecb-activate))


(provide 'siren-ecb)
