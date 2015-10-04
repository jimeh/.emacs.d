;;
;; multiple-cursors
;;

(siren-require-packages '(multiple-cursors))

(require 'multiple-cursors)
(setq mc/edit-lines-empty-lines 'ignore)

(global-set-key (kbd "C-x C-@") 'mc/edit-lines)   ;; Terminal
(global-set-key (kbd "C-x C-SPC") 'mc/edit-lines) ;; GUI
    
(global-set-key (kbd "M-/") 'mc/mark-next-like-this)
(global-set-key (kbd "M-m") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c M-/") 'mc/mark-all-like-this)
(global-set-key (kbd "M-RET") 'set-rectangular-region-anchor)

;; Make alt-<click> add additional cursors
(global-unset-key (kbd "M-<down-mouse-1>")) ;; must unset key first
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)


(provide 'siren-multiple-cursors)