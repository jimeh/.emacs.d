;;
;; Setup a few global keyboard shortcuts
;;

;; Alternative to M-x
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

;; Enable dabbrev-expand via custom keybinding.
(global-set-key (kbd "C-x M-/") 'dabbrev-expand)

;; If Smex is available, use it instead of extended-command
(when (require 'smex nil 'noerror)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "C-x C-m") 'smex)
  (global-set-key (kbd "C-c C-m") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

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

;; Align to equal signs (via helpers.el).
(global-set-key (kbd "C-x a =") 'align-region-to-equals)
(global-set-key (kbd "M-]") 'align-region-to-equals)
(global-set-key (kbd "C-x a {") 'align-region-to-opening-brace)

;; align-regexp
(global-set-key (kbd "C-c C-a") 'align-regexp)
;; (global-set-key (kbd "C-c \\") 'align-regexp) ;; keep till I get used to C-c C-a

;; Toggle auto-fill-mode.
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; Comment or uncomment line
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region-or-line)

(when (require 'auto-complete nil 'noerror)
  (define-key ac-completing-map (kbd "RET") 'ac-complete)
  (define-key ac-completing-map (kbd "C-m") 'ac-complete)
  (define-key ac-completing-map (kbd "C-s") 'ac-isearch)
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous))

;; phi-search (enables C-s and C-r searching with multiple-cursors-mode).
(when (require 'phi-search nil 'noerror)
  (global-set-key (kbd "C-s") 'phi-search)
  (global-set-key (kbd "C-r") 'phi-search-backward))

(when (require 'helm nil 'noerror)
  (define-key helm-map (kbd "<up>") 'previous-history-element)
  (define-key helm-map (kbd "<down>") 'next-history-element)
  (define-key helm-map (kbd "M-p") 'helm-previous-source)
  (define-key helm-map (kbd "M-n") 'helm-next-source)
  (global-set-key (kbd "C-c h") 'helm-mini))

(when (require 'helm-projectile nil 'noerror)
  (global-set-key (kbd "C-x ;") 'helm-projectile)
  (global-set-key (kbd "C-x C-;") 'helm-projectile))

(when (require 'helm-open-github nil 'noerror)
  (global-set-key (kbd "C-c o f") 'helm-open-github-from-file)
  (global-set-key (kbd "C-c o c") 'helm-open-github-from-commit)
  (global-set-key (kbd "C-c o i") 'helm-open-github-from-issues)
  (global-set-key (kbd "C-c o p") 'helm-open-github-from-pull-requests))

;; Expand region
(when (require 'expand-region nil 'noerror)
  (global-set-key (kbd "M-.") 'er/expand-region)
  (global-set-key (kbd "M-,") 'er/contract-region))

;; multiple-cursors
(when (require 'multiple-cursors nil 'noerror)
  (global-set-key (kbd "C-x C-@") 'mc/edit-lines) ;; Terminal
  (global-set-key (kbd "C-x C-SPC") 'mc/edit-lines) ;; GUI
  (global-set-key (kbd "M-/") 'mc/mark-next-like-this)
  (global-set-key (kbd "M-m") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c M-/") 'mc/mark-all-like-this)
  (global-set-key (kbd "M-RET") 'set-rectangular-region-anchor)
  ;; Make alt-<click> add additional cursors
  (global-unset-key (kbd "M-<down-mouse-1>")) ;; must unset key first
  (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click))

;; Browse the kill-ring.
(when (require 'browse-kill-ring nil 'noerror)
  (global-set-key (kbd "C-x C-y") 'browse-kill-ring))

;; Undo/Redo
(when (require 'undo-tree nil 'noerror)
  (global-set-key (kbd "M--") 'undo-tree-undo)
  (global-set-key (kbd "M-_") 'undo-tree-redo))

(when (require 'dash-at-point nil 'noerror)
  (global-set-key (kbd "C-c d") 'dash-at-point))

;; Mac OS X specific keybindings
(when (eq system-type 'darwin)

  ;; Mac OS X Fullscreen (requires Emacs 24.4 or later)
  (global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

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
  (define-key global-map (kbd "C-x C-j") 'ace-jump-mode-pop-mark))

;; projectile related keybindings
(when (require 'projectile nil 'noerror)
  (global-set-key (kbd "C-c C-b") 'projectile-ibuffer)
  (global-set-key (kbd "C-x C-t") 'projectile-find-file)
  (global-set-key (kbd "C-x t") 'projectile-find-test-file)
  (global-set-key (kbd "C-x C-v") 'projectile-switch-to-buffer)
  (global-set-key (kbd "C-c C-s") 'projectile-switch-project))

;; Textmate-mode related keybindings
(when (require 'textmate nil 'noerror)
  (global-set-key (kbd "C-t") 'textmate-goto-symbol)
  ;; (global-set-key (kbd "M-p") 'textmate-column-up)
  ;; (global-set-key (kbd "M-n") 'textmate-column-down)
  (global-set-key (kbd "C-c [") 'textmate-shift-left)
  (global-set-key (kbd "C-c ]") 'textmate-shift-right))

;; move-text
(when (require 'move-text nil 'noerror)
  ;; Must be set after textmate is required.
  (define-key global-map (kbd "M-p") 'move-text-up)
  (define-key global-map (kbd "M-n") 'move-text-down))

;; smartparens
;; (when (require 'smartparens nil 'noerror)
;;   ;; Must be set after textmate is required.
;;   (define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
;;   (define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)
;;   (define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
;;   (define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp))

;; Set/increase/decrease transparency (via helpers.el)
(global-set-key (kbd "C-M-|") 'transparency-set-value)
(global-set-key (kbd "C-M-<") 'transparency-increase)
(global-set-key (kbd "C-M->") 'transparency-decrease)

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
;; (define-key global-map (kbd "C-c r") 'org-remember)
;; (define-key global-map (kbd "C-M-r") 'org-remember)

;; Rename current file and buffer (via helpers.el)
(global-set-key (kbd "C-c r")  'rename-file-and-buffer)

;; Allow hash to be entered on UK keyboards (via helpers.el)
(global-set-key (kbd "M-3") 'insert-hash)

;; tiling.el related bindings
(when (require 'tiling nil 'noerror)
  (define-key global-map (kbd "C-\\") 'tiling-cycle))

;; ElScreen related shortcuts
(when (require 'elscreen nil 'noerror)
  (define-key elscreen-map (kbd "C-z") elscreen-map)

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

(when (require 'workgroups2 nil 'noerror)
  (setq wg-prefix-key (kbd "C-z"))
)

(when (require 'perspective nil 'noerror)
  (define-key persp-mode-map (kbd "C-z") perspective-map)

  (define-key persp-mode-map (kbd "C-z s") 'persp-switch)
  (define-key persp-mode-map (kbd "C-z C-s") 'persp-switch)
  (define-key persp-mode-map (kbd "C-z b") 'persp-switch)
  (define-key persp-mode-map (kbd "C-z C-b") 'persp-switch)

  (define-key persp-mode-map (kbd "C-z c") 'persp-remove-buffer)
  (define-key persp-mode-map (kbd "C-z C-c") 'persp-remove-buffer)

  (define-key persp-mode-map (kbd "C-z k") 'persp-kill)
  (define-key persp-mode-map (kbd "C-z C-k") 'persp-kill)

  (define-key persp-mode-map (kbd "C-z r") 'persp-rename)
  (define-key persp-mode-map (kbd "C-z C-r") 'persp-rename)

  (define-key persp-mode-map (kbd "C-z a") 'persp-add-buffer)
  (define-key persp-mode-map (kbd "C-z C-a") 'persp-add-buffer)

  (define-key persp-mode-map (kbd "C-z i") 'persp-import)
  (define-key persp-mode-map (kbd "C-z C-i") 'persp-import)

  (define-key persp-mode-map (kbd "C-z n") 'persp-next)
  (define-key persp-mode-map (kbd "C-z C-n") 'persp-next)
  (define-key persp-mode-map (kbd "C-z p") 'persp-prev)
  (define-key persp-mode-map (kbd "C-z C-p") 'persp-prev)
)

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
