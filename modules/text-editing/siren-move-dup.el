;;; siren-move-dup.el --- jimeh's Emacs Siren: move-dup

;;; Commentary:

;; Configuration for move-dup

;;; Code:

(use-package move-dup
  :bind
  ("M-p" . md/move-lines-up)
  ("M-n" . md/move-lines-down)
  ("C-x C-d" . md/duplicate-down))

(provide 'siren-move-dup)
;;; siren-move-dup.el ends here
