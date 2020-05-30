;;; siren-windmove.el --- jimeh's Emacs Siren: windmove

;;; Commentary:

;; Configuration for windmove.

;;; Code:

(use-package windmove
  :straight (:type built-in)

  :bind
  ("M-i" . siren-windmove-up)
  ("M-k" . siren-windmove-down)
  ("M-j" . siren-windmove-left)
  ("M-l" . siren-windmove-right)

  :custom
  (siren-windmove-tmux-fallback (if (getenv "TMUX") t nil))

  :init
  (defun siren-windmove-up ()
    (interactive)
    (if (and (not (ignore-errors (windmove-up)))
             siren-windmove-tmux-fallback)
        (shell-command "tmux select-pane -U")))

  (defun siren-windmove-down ()
    (interactive)
    (if (and (not (ignore-errors (windmove-down)))
             siren-windmove-tmux-fallback)
        (shell-command "tmux select-pane -D")))

  (defun siren-windmove-left ()
    (interactive)
    (if (and (not (ignore-errors (windmove-left)))
             siren-windmove-tmux-fallback)
        (shell-command "tmux select-pane -L")))

  (defun siren-windmove-right ()
    (interactive)
    (if (and (not (ignore-errors (windmove-right)))
             siren-windmove-tmux-fallback)
        (shell-command "tmux select-pane -R"))))

(provide 'siren-windmove)
;;; siren-windmove.el ends here
