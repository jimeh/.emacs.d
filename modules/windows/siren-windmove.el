;;; siren-windmove.el --- jimeh's Emacs Siren: windmove

;;; Commentary:

;; Configuration for windmove.

;;; Code:

(when (version< emacs-version "27.0")
  (use-package buffer-move
    :defer t))

(use-package windmove
  :straight (:type built-in)

  :bind
  ("M-i" . siren-windmove-up)
  ("M-k" . siren-windmove-down)
  ("M-j" . siren-windmove-left)
  ("M-l" . siren-windmove-right)
  ("M-K" . siren-windmove-swap-down)
  ("M-I" . siren-windmove-swap-up)
  ("M-J" . siren-windmove-swap-left)
  ("M-L" . siren-windmove-swap-right)

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
        (shell-command "tmux select-pane -R")))

  (defun siren-windmove-swap-defun (direction)
    "Define window swap function for DIRECTION.
On Emacs 27.0 or later use windmove, on earlier use buffer-move package."
    `(defun ,(intern (format "siren-windmove-swap-%s" direction)) ()
       (interactive)
       (,(intern (format (if (version< emacs-version "27.0")
                             "buf-move-%s"
                           "windmove-swap-states-%s")
                         direction)))))

  (defmacro siren-windmove-swap-defuns (directions)
    `(progn ,@(mapcar 'siren-windmove-swap-defun directions)))

  (siren-windmove-swap-defuns (up down left right)))
(provide 'siren-windmove)
;;; siren-windmove.el ends here
