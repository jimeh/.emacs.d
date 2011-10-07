;;
;; Setup a few global keyboard shortcuts
;;

;; Alternative to M-x
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

;; Easier version of "C-x k" to kill buffer
(global-set-key (kbd "C-x C-k") 'kill-buffer)

;; Cut
(global-set-key (kbd "C-w") 'backward-kill-word)

;; Kill-Ring related.
(global-set-key (kbd "M-Y") 'yank-pop-forwards)

;; Scroll up/down
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)

;; Move to beginning/end of line
(global-set-key (kbd "s-<left>") 'beginning-of-line)
(global-set-key (kbd "s-<right>") 'end-of-line)

;; Window switching (via helpers.el).
(global-set-key (kbd "C-x C-o") 'other-window)         ;; other-window
(global-set-key (kbd "C-x C-i") 'other-window-reverse) ;; other-window -1

;; IBuffer
(when (require 'ibuffer nil 'noerror)
  (global-set-key (kbd "C-x C-b") 'ibuffer))

;; Undo/Redo (via undo-tree)
(when (require 'undo-tree nil 'noerror)
  (global-set-key (kbd "s-z") 'undo-tree-undo)
  (global-set-key (kbd "s-Z") 'undo-tree-redo))

(when (require 'textmate nil 'noerror)
  (global-set-key (kbd "M-p") 'textmate-column-up)
  (global-set-key (kbd "M-n") 'textmate-column-down))

(when (require 'flyspell nil 'noerror)
  (global-set-key (kbd "s-.") 'flyspell-correct-word-before-point))

;; Duplicate line (via helpers.el)
(global-set-key (kbd "C-x C-d") 'duplicate-line)

;; Fullscreen (works only with `brew install emacs --cocoa`)
(global-set-key (kbd "s-<return>") 'ns-toggle-fullscreen)

;; Set/increase/decrease transparency (via helpers.el)
(global-set-key (kbd "C-?") 'transparency-set-value)
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

;; ElScreen related shortcuts
(when (require 'elscreen nil 'noerror)
  (global-set-key (kbd "s-}") 'elscreen-next)
  (global-set-key (kbd "s-{") 'elscreen-previous)
  (global-set-key (kbd "C-z ,") 'elscreen-screen-nickname)
  (global-set-key (kbd "C-z C-,") 'elscreen-screen-nickname)
  (global-set-key (kbd "C-z l") 'elscreen-toggle)
  (global-set-key (kbd "C-z C-l") 'elscreen-toggle))

;; Escreen customizations (with help from helpers.el).
(when (require 'escreen nil 'noerror)

  ;; Set prefix key to C-z.
  (setq escreen-prefix-char (kbd "C-z"))
  (global-set-key escreen-prefix-char 'escreen-prefix)
  (define-key escreen-map escreen-prefix-char 'escreen-goto-last-screen)

  ;; Toggle screens.
  (define-key escreen-map (kbd "l") 'escreen-goto-last-screen)
  (define-key escreen-map (kbd "C-l") 'escreen-goto-last-screen)

  ;; List screens.
  (define-key escreen-map (kbd "a") 'escreen-get-active-screen-numbers-with-emphasis)
  (define-key escreen-map (kbd "C-a") 'escreen-get-active-screen-numbers-with-emphasis)
  (define-key escreen-map (kbd ";") 'escreen-get-active-screen-numbers-with-emphasis)
  (define-key escreen-map (kbd "C-;") 'escreen-get-active-screen-numbers-with-emphasis)

  ;; Goto screens.
  (define-key escreen-map (kbd "o") 'escreen-goto-next-screen)
  (define-key escreen-map (kbd "C-o") 'escreen-goto-next-screen)
  (define-key escreen-map (kbd "i") 'escreen-goto-prev-screen)
  (define-key escreen-map (kbd "C-i") 'escreen-goto-prev-screen)
  (global-set-key (kbd "s-}") 'escreen-goto-next-screen)
  (global-set-key (kbd "s-{") 'escreen-goto-prev-screen)

  ;; Ctrl versions of default commands.
  (define-key escreen-map (kbd "C-c") 'escreen-create-screen)
  (define-key escreen-map (kbd "C-g") 'escreen-goto-screen)
  (define-key escreen-map (kbd "C-k") 'escreen-kill-screen)
  (define-key escreen-map (kbd "C-n") 'escreen-goto-next-screen)
  (define-key escreen-map (kbd "C-p") 'escreen-goto-prev-screen)

  ;; Show list of screens when you switch/create/kill.
  (add-hook 'escreen-goto-screen-hook 'escreen-get-active-screen-numbers-with-emphasis)
)
