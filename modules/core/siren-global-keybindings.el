;;; siren-global-keybindings.el --- jimeh's Emacs Siren: Global keybindings.

;;; Commentary:

;; Basic global keybindings.

;;; Code:

(siren-general-define-key
 ;; Enable alternative to M-x.
 "C-x C-m" 'execute-extended-command
 "s-P" 'execute-extended-command

 ;; Enable dabbrev-expand via custom keybinding.
 "C-x M-/" 'dabbrev-expand

 ;; Easier version of "C-x k" to kill buffer
 "C-x C-k" 'kill-buffer

 ;; Evaluate buffer
 "C-c C-e" 'eval-buffer

 ;; Window switching
 "C-x i"   'siren-other-window-reverse
 "C-x C-o" 'other-window
 "C-x C-i" 'siren-other-window-reverse

 ;; Window management
 "C-x C-SPC" 'balance-windows
 "C-x SPC" 'balance-windows

 ;; Kill-Ring related
 "M-Y" 'siren-yank-pop-forwards

 ;; Align to equal signs
 "C-x a =" 'siren-align-region-to-equals
 "C-x a {" 'siren-align-region-to-opening-brace

 ;; align-regexp
 "C-c a" 'align-regexp

 ;; Toggle auto-fill-mode.
 "C-c q" 'auto-fill-mode

 ;; iBuffer
 "C-x C-b" 'ibuffer

 ;; Rename current file and buffer
 "C-c r"  'siren-rename-file-and-buffer)

;; macOS specific keybindings
(when (eq system-type 'darwin)
  (siren-general-define-key
   ;; Move to beginning/end of buffer
   "s-<up>" 'beginning-of-buffer
   "s-<down>" 'end-of-buffer

   ;; Move to beginning/end of line
   "s-<left>" 'beginning-of-line
   "s-<right>" 'end-of-line))

(provide 'siren-global-keybindings)
;;; siren-global-keybindings.el ends here
