;;; siren-buffer-move.el --- jimeh's Emacs Siren: buffer-move

;;; Commentary:

;; Configuration for buffer-move

;;; Code:

(use-package buffer-move
  :bind
  ("M-K" . buf-move-down)
  ("M-I" . buf-move-up)
  ("M-J" . buf-move-left)
  ("M-L" . buf-move-right))

(provide 'siren-buffer-move)
;;; siren-buffer-move.el ends here
