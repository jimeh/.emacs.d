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
(global-set-key (kbd "C-x a {") 'siren-align-region-to-opening-brace)

;; align-regexp
(global-set-key (kbd "C-c a") 'align-regexp)

;; Toggle auto-fill-mode.
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Rename current file and buffer
(global-set-key (kbd "C-c r")  'siren-rename-file-and-buffer)

;; Flyspell correct previous word
(when (require 'flyspell nil 'noerror)
  (global-set-key (kbd "s-.") 'flyspell-correct-word-before-point))

;; Mac OS X specific keybindings
(when (eq system-type 'darwin)
  ;; Move to beginning/end of buffer
  (global-set-key (kbd "s-<up>") 'beginning-of-buffer)
  (global-set-key (kbd "s-<down>") 'end-of-buffer)

  ;; Move to beginning/end of line
  (global-set-key (kbd "s-<left>") 'beginning-of-line)
  (global-set-key (kbd "s-<right>") 'end-of-line))

(provide 'siren-global-keybindings)
;;; siren-global-keybindings.el ends here
