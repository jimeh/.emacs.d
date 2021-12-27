;;; siren-github-review.el --- jimeh's Emacs Siren: github-review configuration

;;; Commentary:

;; Basic configuration for github-review.

;;; Code:

(use-package github-review
  :defer t
  :custom
  (github-review-fill-column 80)
  (github-review-lgtm-message "lgtm :)")
  (github-review-new-buffer-window-strategy 'switch-to-buffer))

(provide 'siren-github-review)
;;; siren-github-review.el ends here
