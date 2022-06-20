;;; siren-highlight-indent-guides.el --- jimeh's Emacs Siren: highlight-indent-guides-mode configuration.

;;; Commentary:

;; Basic configuration for highlight-indent-guides-mode.

;;; Code:

(use-package highlight-indent-guides
  :defer t
  :commands highlight-indent-guides-mode
  :diminish highlight-indent-guides-mode

  :custom
  (highlight-indent-guides-auto-enabled nil)
  (highlight-indent-guides-character ?\u2502)
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-responsive nil))

(provide 'siren-highlight-indent-guides)
;;; siren-highlight-indent-guides.el ends here
