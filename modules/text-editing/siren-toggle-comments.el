;;; siren-toggle-comments.el --- jimeh's Emacs Siren: toggle-comments  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Allows to toggle comments for current line or selected region.

;;; Code:

(use-package newcomment
  :straight (:type built-in)

  :general
  ("s-/" 'comment-or-uncomment-region-or-line)
  ("C-c /" 'comment-or-uncomment-region-or-line)
  ("C-c C-/" 'comment-or-uncomment-region-or-line)
  ("C-c C-_" 'comment-or-uncomment-region-or-line)

  :preface
  (defun comment-or-uncomment-region-or-line (&optional beg end arg)
    "Comments or uncomments the region or current line."
    (interactive "P")
    (if (region-active-p)
        (comment-or-uncomment-region (region-beginning) (region-end) arg)
      (comment-or-uncomment-region (line-beginning-position)
                                   (line-end-position) arg))))

(provide 'siren-toggle-comments)
;;; siren-toggle-comments.el ends here
