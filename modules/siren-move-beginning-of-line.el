;;; siren-move-beginning-of-line.el --- jimeh's Emacs Siren: move-beginning-of-line.

;;; Commentary:

;; Tweak behavior of C-a.

;;; Code:

(defun siren-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there.

Borrowed from: http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/"
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; Use siren-move-beginning-of-line
(global-set-key (kbd "C-a") 'siren-move-beginning-of-line)

(provide 'siren-move-beginning-of-line)
;;; siren-move-beginning-of-line.el ends here
