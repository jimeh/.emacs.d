;;; siren-window-management.el --- jimeh's Emacs Siren: window-management.

;;; Commentary:

;; Basic window management stuff.

;;; Code:

(use-package buffer-move
  :bind
  ("M-K" . buf-move-down)
  ("M-I" . buf-move-up)
  ("M-J" . buf-move-left)
  ("M-L" . buf-move-right))

(require 'windmove)

(defun ignore-error-wrapper (fn)
  "Funtion return new function that ignore errors.
   The function wraps a function with `ignore-errors' macro."
  (lexical-let ((fn fn))
    (lambda ()
      (interactive)
      (ignore-errors (funcall fn)))))

;; Navigate to windows
(global-set-key (kbd "M-k") (ignore-error-wrapper 'windmove-down))
(global-set-key (kbd "M-i") (ignore-error-wrapper 'windmove-up))
(global-set-key (kbd "M-j") (ignore-error-wrapper 'windmove-left))
(global-set-key (kbd "M-l") (ignore-error-wrapper 'windmove-right))

(provide 'siren-window-management)
;;; siren-window-management.el ends here
