;;; siren-window-management.el --- jimeh's Emacs Siren: window-management.

;;; Commentary:

;; Basic window management stuff.

;;; Code:

(defun ignore-error-wrapper (fn)
  "Funtion return new function that ignore errors.
   The function wraps a function with `ignore-errors' macro."
  (lexical-let ((fn fn))
    (lambda ()
      (interactive)
      (ignore-errors
        (funcall fn)))))

(siren-require-packages '(buffer-move))

(require 'windmove)
(require 'buffer-move)

;; Navigate to windows
(global-set-key (kbd "M-k") (ignore-error-wrapper 'windmove-down))
(global-set-key (kbd "M-i") (ignore-error-wrapper 'windmove-up))
(global-set-key (kbd "M-j") (ignore-error-wrapper 'windmove-left))
(global-set-key (kbd "M-l") (ignore-error-wrapper 'windmove-right))

;; Swap buffers between windows
(global-set-key (kbd "M-K") 'buf-move-down)
(global-set-key (kbd "M-I") 'buf-move-up)
(global-set-key (kbd "M-J") 'buf-move-left)
(global-set-key (kbd "M-L") 'buf-move-right)

(provide 'siren-window-management)
;;; siren-window-management.el ends here
