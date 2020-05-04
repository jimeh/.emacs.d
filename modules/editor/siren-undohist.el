;;; siren-undohist.el --- jimeh's Emacs Siren: undohist configuration.

;;; Commentary:

;; Basic configuration for undohist.

;;; Code:

(use-package undohist
  :demand
  :custom
  (undohist-directory (expand-file-name "undohist" siren-cache-dir))
  (undohist-ignored-files '("COMMIT_EDITMSG"))

  :config
  (undohist-initialize))

(provide 'siren-undohist)
;;; siren-undohist.el ends here
