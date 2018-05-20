;;; siren-highlight-indent-guides.el --- jimeh's Emacs Siren: highlight-indent-guides-mode configuration.

;;; Commentary:

;; Basic configuration for highlight-indent-guides-mode.

;;; Code:

(use-package highlight-indent-guides
  :defer t
  :commands highlight-indent-guides-mode
  :diminish highlight-indent-guides-mode)

(provide 'siren-highlight-indent-guides)
;;; siren-highlight-indent-guides.el ends here
