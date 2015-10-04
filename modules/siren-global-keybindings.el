;;
;; global keybindings (customized)
;;

(require 'siren-helpers)

;; Enable dabbrev-expand via custom keybinding.
(global-set-key (kbd "C-x M-/") 'dabbrev-expand)

;; Easier version of "C-x k" to kill buffer
(global-set-key (kbd "C-x C-k") 'kill-buffer)

;; Evaluate buffer
(global-set-key (kbd "C-c C-e") 'eval-buffer)

;; Duplicate line (via siren-helpers.el)
(global-set-key (kbd "C-x C-d") 'duplicate-current-line-or-region)

;; Switch to next/previous buffer
(global-set-key (kbd "C-c C-n") 'switch-to-next-buffer)
(global-set-key (kbd "C-c C-p") 'switch-to-prev-buffer)

;; Window switching (via siren-helpers.el).
(global-set-key (kbd "C-x i")   'other-window-reverse)
(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-x C-i") 'other-window-reverse)

;; Kill-Ring related (via siren-helpers.el).
(global-set-key (kbd "M-Y") 'yank-pop-forwards)

;; Align to equal signs (via siren-helpers.el).
(global-set-key (kbd "C-x a =") 'align-region-to-equals)
(global-set-key (kbd "M-]") 'align-region-to-equals)
(global-set-key (kbd "C-x a {") 'align-region-to-opening-brace)

;; align-regexp
(global-set-key (kbd "C-c C-a") 'align-regexp)

;; Toggle auto-fill-mode.
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; Custom HideShow toggles (via siren-helpers.el)
(global-set-key (kbd "C-=") 'toggle-selective-display)
(global-set-key (kbd "C-\\") 'toggle-hiding)

;; undo/redo via undo-tree
(global-set-key (kbd "M--") 'undo-tree-undo)
(global-set-key (kbd "M-_") 'undo-tree-redo)

;; iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; String inflections
(siren-require-packages '(string-inflection))
(require 'string-inflection)
(global-set-key (kbd "C-c C-.") 'string-inflection-cycle)

;; Rename current file and buffer (via siren-helpers.el)
(global-set-key (kbd "C-c r")  'rename-file-and-buffer)

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



(provide 'siren-global-keybindings)
