;;; siren-expand-region.el --- jimeh's Emacs Siren: expand-region  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Configuration for expand-region

;;; Code:

(use-package expand-region
  :general
  ("M-." 'er/expand-region)
  ("M-," 'er/contract-region))

(provide 'siren-expand-region)
;;; siren-expand-region.el ends here
