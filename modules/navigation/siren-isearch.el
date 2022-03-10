;;; siren-isearch.el --- jimeh's Emacs Siren: isearch configuration.

;;; Commentary:

;; Basic configuration for isearch.

;;; Code:

(use-package isearch
  :straight (:type built-in)
  :custom
  (isearch-lazy-count t)
  (regexp-search-ring-max 200)
  (search-default-mode t)
  (search-ring-max 200))

(provide 'siren-isearch)
;;; siren-isearch.el ends here
