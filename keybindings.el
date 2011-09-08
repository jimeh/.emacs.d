;;
;; Setup a few global keyboard shortcuts
;;

;; Undo/Redo (via undo-tree)
(when (require 'undo-tree nil 'noerror)
  (global-set-key (kbd "s-z") 'undo-tree-undo)
  (global-set-key (kbd "s-Z") 'undo-tree-redo))

;; Move to beginning/end of line
(global-set-key (kbd "s-<left>") 'beginning-of-line)
(global-set-key (kbd "s-<right>") 'end-of-line)

;; Scroll up/down
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)
(global-set-key (kbd "M-p") 'beginning-of-buffer)
(global-set-key (kbd "M-n") 'end-of-buffer)

;; Duplicate line (via helpers.el)
(global-set-key (kbd "C-x C-d") 'duplicate-line)

;; Alternative to M-x
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

;; Easier version of "C-x k" to kill buffer
(global-set-key (kbd "C-x C-k") 'kill-buffer)

;; Cut
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-c C-k") 'kill-region)

;; Window switching (via helpers.el).
(global-set-key (kbd "C-x C-o") 'other-window)         ;; other-window
(global-set-key (kbd "C-x C-i") 'other-window-reverse) ;; other-window -1

;; Fullscreen (works only with `brew install emacs --cocoa`)
(global-set-key (kbd "s-<return>") 'ns-toggle-fullscreen)

;; Set transparency
(global-set-key (kbd "C-?") 'transparency-set-value)

;; Increase/decrease transparency
(global-set-key (kbd "C-<") 'transparency-increase)
(global-set-key (kbd "C->") 'transparency-decrease)

;; Window Tiling (via helpers.el)
(global-set-key (kbd "C-M-K") (lambda () (interactive) (swap-with 'down)))
(global-set-key (kbd "C-M-I") (lambda () (interactive) (swap-with 'up)))
(global-set-key (kbd "C-M-J") (lambda () (interactive) (swap-with 'left)))
(global-set-key (kbd "C-M-L") (lambda () (interactive) (swap-with 'right)))

(global-set-key (kbd "M-K") (lambda () (interactive) (enlarge-window 1)))
(global-set-key (kbd "M-I") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "M-J") (lambda () (interactive) (enlarge-window -1 t)))
(global-set-key (kbd "M-L") (lambda () (interactive) (enlarge-window 1 t)))

(global-set-key (kbd "M-k") 'windmove-down)
(global-set-key (kbd "M-i") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
