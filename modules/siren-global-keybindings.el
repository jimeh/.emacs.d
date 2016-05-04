;;; siren-global-keybindings.el --- jimeh's Emacs Siren: Global keybindings.

;;; Commentary:

;; Basic global keybindings.

;;; Code:

;; Enable dabbrev-expand via custom keybinding.
(global-set-key (kbd "C-x M-/") 'dabbrev-expand)

;; Easier version of "C-x k" to kill buffer
(global-set-key (kbd "C-x C-k") 'kill-buffer)

;; Evaluate buffer
(global-set-key (kbd "C-c C-e") 'eval-buffer)

;; Window switching
(global-set-key (kbd "C-x i")   'siren-other-window-reverse)
(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-x C-i") 'siren-other-window-reverse)

;; Kill-Ring related
(global-set-key (kbd "M-Y") 'siren-yank-pop-forwards)

;; Align to equal signs
(global-set-key (kbd "C-x a =") 'siren-align-region-to-equals)
(global-set-key (kbd "M-]") 'siren-align-region-to-equals)
(global-set-key (kbd "C-x a {") 'siren-align-region-to-opening-brace)

;; align-regexp
(global-set-key (kbd "C-c C-a") 'align-regexp)

;; Toggle auto-fill-mode.
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; undo/redo via undo-tree
(global-set-key (kbd "M--") 'undo-tree-undo)
(global-set-key (kbd "M-_") 'undo-tree-redo)

;; iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; String inflections
(siren-require-packages '(string-inflection))
(require 'string-inflection)
(global-set-key (kbd "C-c C-.") 'string-inflection-cycle)

;; Rename current file and buffer
(global-set-key (kbd "C-c r")  'siren-rename-file-and-buffer)

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
;;; siren-global-keybindings.el ends here
