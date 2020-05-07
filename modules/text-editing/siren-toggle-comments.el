;;; siren-toggle-comments.el --- jimeh's Emacs Siren: toggle-comments

;;; Commentary:

;; Allows to toggle comments for current line or selected region. Shamelessly
;; ripped from textmate.el: https://github.com/defunkt/textmate.el

;;; Code:

(unless (fboundp 'comment-or-uncomment-region-or-line)
  (siren-allow-line-as-region-for-function comment-or-uncomment-region))

(global-set-key (kbd "C-c /") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-_") 'comment-or-uncomment-region-or-line)

(provide 'siren-toggle-comments)
;;; siren-toggle-comments.el ends here
