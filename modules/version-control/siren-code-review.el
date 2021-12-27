;;; siren-code-review.el --- jimeh's Emacs Siren: code-review configuration

;;; Commentary:

;; Basic configuration for code-review.

;;; Code:

(use-package code-review
  :defer t
  :custom
  (code-review-db-database-file (expand-file-name
                                 "code-review-db.sqlite" siren-cache-dir))
  (code-review-fill-column 80)
  (code-review-lgtm-message "lgtm :)")
  (code-review-new-buffer-window-strategy 'switch-to-buffer))

(provide 'siren-code-review)
;;; siren-code-review.el ends here
