;;
;; neotree
;;

(siren-require-packages '(neotree))

(require 'neotree)
(global-set-key (kbd "C-x p") 'neotree-toggle)

(setq neo-show-hidden-files t)
(setq neo-smart-open nil)
(setq neo-theme (quote nerd))
(setq neo-window-width 54)

(provide 'siren-neotree)
