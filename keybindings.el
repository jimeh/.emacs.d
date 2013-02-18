;;
;; Setup a few global keyboard shortcuts
;;

;; Alternative to M-x
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

;; If Smex is available, use it instead of extended-command
(when (require 'smex nil 'noerror)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "C-x C-m") 'smex)
  (global-set-key (kbd "C-c C-m") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
)

;; Easier version of "C-x k" to kill buffer
(global-set-key (kbd "C-x C-k") 'kill-buffer)

;; Evaluate buffer
(global-set-key (kbd "C-c C-e") 'eval-buffer)

;; Goto line
(global-set-key (kbd "C-c C-l") 'goto-line)

;; Switch to next/previous buffer
(global-set-key (kbd "C-c C-n") 'switch-to-next-buffer)
(global-set-key (kbd "C-c C-p") 'switch-to-prev-buffer)

;; Duplicate line (via helpers.el)
(global-set-key (kbd "C-x C-d") 'duplicate-current-line-or-region)

;; Window switching (via helpers.el).
(global-set-key (kbd "C-x i")   'other-window-reverse)
(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-x C-i") 'other-window-reverse)

;; Kill-Ring related (via helpers.el).
(global-set-key (kbd "M-Y") 'yank-pop-forwards)

;; Browse the kill-ring.
(when (require 'browse-kill-ring nil 'noerror)
  (global-set-key (kbd "C-x C-y") 'browse-kill-ring))

;; Align to equal signs (via helpers.el).
(global-set-key (kbd "C-x a =") 'align-region-to-equals)
(global-set-key (kbd "M-]") 'align-region-to-equals)
(global-set-key (kbd "C-x a {") 'align-region-to-opening-brace)
(global-set-key (kbd "M-[") 'align-region-to-opening-brace)

;; align-regexp
(global-set-key (kbd "C-c \\") 'align-regexp)

;; Toggle auto-fill-mode.
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; Comment or uncomment line
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region-or-line)

;; Undo/Redo
(when (require 'undo-tree nil 'noerror)
  (global-set-key (kbd "M--") 'undo-tree-undo)
  (global-set-key (kbd "M-_") 'undo-tree-redo))

;; Mac OS X specific keybindings
(when (eq system-type 'darwin)

  ;; Mac OS X Fullscreen (requires this patch: https://gist.github.com/1012927)
  (global-set-key (kbd "s-<return>") 'ns-toggle-fullscreen)

  ;; Undo/Redo (via undo-tree)
  (when (require 'undo-tree nil 'noerror)
    (global-set-key (kbd "s-z") 'undo-tree-undo)
    (global-set-key (kbd "s-Z") 'undo-tree-redo))

  ;; Flyspell correct previous word
  (when (require 'flyspell nil 'noerror)
    (global-set-key (kbd "s-.") 'flyspell-correct-word-before-point))

  ;; Move to beginning/end of buffer
  (global-set-key (kbd "s-<up>") 'beginning-of-buffer)
  (global-set-key (kbd "s-<down>") 'end-of-buffer)

  ;; Move to beginning/end of line
  (global-set-key (kbd "s-<left>") 'beginning-of-line)
  (global-set-key (kbd "s-<right>") 'end-of-line))

;; IBuffer
(when (require 'ibuffer nil 'noerror)
  (global-set-key (kbd "C-x C-b") 'ibuffer))

;; ECB
(when (require 'ecb nil 'noerror)
  (global-set-key (kbd "C-c C-.") 'ecb-activate))

;; Magit
(when (require 'magit nil 'noerror)
  (global-set-key (kbd "C-x g") 'magit-status))

;; Ace-Jump mode
(when (require 'ace-jump-mode nil 'noerror)
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
  (define-key global-map (kbd "C-c C-j") 'ace-jump-mode)
  ;; pop-mark
  (eval-after-load "ace-jump-mode" '(ace-jump-mode-enable-mark-sync))
  (define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
  (define-key global-map (kbd "C-x C-j") 'ace-jump-mode-pop-mark)
)

;; eproject related keybindings
(when (require 'eproject nil 'noerror)
  (global-set-key (kbd "C-c C-b") 'eproject-ibuffer)
  (global-set-key (kbd "C-x p b") 'eproject-ibuffer)
  (global-set-key (kbd "C-x p t") 'eproject-todo)
  (global-set-key (kbd "C-x p f") 'eproject-find-file)
  (global-set-key (kbd "C-x p k") 'eproject-kill-project-buffers)
  (global-set-key (kbd "C-x p o") 'eproject-open-all-project-files))

;; Textmate-mode related keybindings
(when (require 'textmate nil 'noerror)
  (global-set-key (kbd "C-x C-t") 'textmate-goto-file)
  (global-set-key (kbd "C-c C-t") 'textmate-goto-symbol)
  (global-set-key (kbd "M-p") 'textmate-column-up)
  (global-set-key (kbd "M-n") 'textmate-column-down)
  (global-set-key (kbd "C-c [") 'textmate-shift-left)
  (global-set-key (kbd "C-c ]") 'textmate-shift-right))

;; Set/increase/decrease transparency (via helpers.el)
(global-set-key (kbd "C-|") 'transparency-set-value)
(global-set-key (kbd "C-<") 'transparency-increase)
(global-set-key (kbd "C->") 'transparency-decrease)

;; Window Resizing
(define-key global-map (kbd "C-{") 'shrink-window-horizontally)
(define-key global-map (kbd "C-}") 'enlarge-window-horizontally)
(define-key global-map (kbd "C-^") 'enlarge-window)

;; Move buffers between windows
(when (require 'buffer-move nil 'noerror)
  (global-set-key (kbd "M-K") 'buf-move-down)
  (global-set-key (kbd "M-I") 'buf-move-up)
  (global-set-key (kbd "M-J") 'buf-move-left)
  (global-set-key (kbd "M-L") 'buf-move-right))

;; Window Tiling (via helpers.el)
(global-set-key (kbd "M-k") 'windmove-down)
(global-set-key (kbd "M-i") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)

;; Org-mode
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c l") 'org-store-link)

;; Remember mode
(define-key global-map (kbd "C-c r") 'org-remember)
(define-key global-map (kbd "C-M-r") 'org-remember)

;; Allow hash to be entered on UK keyboards (via helpers.el)
(global-set-key (kbd "M-3") 'insert-hash)

;; tiling.el related bindings
(when (require 'tiling nil 'noerror)
  (define-key global-map (kbd "C-\\") 'tiling-cycle))

;; ElScreen related shortcuts
(when (require 'elscreen nil 'noerror)

  ;; Goto screens.
  (global-set-key (kbd "s-}") 'elscreen-next)
  (global-set-key (kbd "s-{") 'elscreen-previous)

  ;; Set screen nickname
  (define-key elscreen-map (kbd ",")   'elscreen-screen-nickname)
  (define-key elscreen-map (kbd "C-,") 'elscreen-screen-nickname)

  ;; Toggle screens.
  (define-key elscreen-map (kbd "l")   'elscreen-toggle)
  (define-key elscreen-map (kbd "C-l") 'elscreen-toggle)

  ;; Display list of screens.
  (define-key elscreen-map (kbd ";")   'elscreen-display-screen-name-list)
  (define-key elscreen-map (kbd "C-;") 'elscreen-display-screen-name-list))

;; Escreen customizations (via helpers.el).
(when (require 'escreen nil 'noerror)

  ;; Set prefix key to C-z.
  (setq escreen-prefix-char (kbd "C-z"))
  (global-set-key escreen-prefix-char 'escreen-prefix)
  (define-key escreen-map escreen-prefix-char 'escreen-goto-last-screen)

  ;; Toggle screens.
  (define-key escreen-map (kbd "l") 'escreen-goto-last-screen)
  (define-key escreen-map (kbd "C-l") 'escreen-goto-last-screen)

  ;; List screens.
  (define-key escreen-map (kbd "a")
    'escreen-get-active-screen-numbers-with-emphasis)
  (define-key escreen-map (kbd "C-a")
    'escreen-get-active-screen-numbers-with-emphasis)
  (define-key escreen-map (kbd ";")
    'escreen-get-active-screen-numbers-with-emphasis)
  (define-key escreen-map (kbd "C-;")
    'escreen-get-active-screen-numbers-with-emphasis)

  ;; Goto screens.
  (global-set-key (kbd "s-}") 'escreen-goto-next-screen)
  (global-set-key (kbd "s-{") 'escreen-goto-prev-screen)

  ;; Ctrl versions of default commands.
  (define-key escreen-map (kbd "C-c") 'escreen-create-screen)
  (define-key escreen-map (kbd "C-g") 'escreen-goto-screen)
  (define-key escreen-map (kbd "C-k") 'escreen-kill-screen)
  (define-key escreen-map (kbd "C-n") 'escreen-goto-next-screen)
  (define-key escreen-map (kbd "C-p") 'escreen-goto-prev-screen)

  ;; Show list of screens when you switch/create/kill.
  (add-hook 'escreen-goto-screen-hook
            'escreen-get-active-screen-numbers-with-emphasis))
