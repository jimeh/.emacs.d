;;; siren-highlight-indent-guides.el --- jimeh's Emacs Siren: highlight-indent-guides-mode configuration.

;;; Commentary:

;; Basic configuration for highlight-indent-guides-mode.

;;; Code:

(use-package highlight-indent-guides
  :defer t
  :commands highlight-indent-guides-mode
  :diminish highlight-indent-guides-mode

  :hook
  (prog-mode . highlight-indent-guides-mode)

  :custom
  (highlight-indent-guides-auto-even-face-perc 3)
  (highlight-indent-guides-auto-odd-face-perc 2.5)
  (highlight-indent-guides-auto-top-even-face-perc 12)
  (highlight-indent-guides-auto-top-odd-face-perc 10)
  (highlight-indent-guides-character ?\u2502)
  (highlight-indent-guides-method 'column)
  (highlight-indent-guides-responsive 'top))

(provide 'siren-highlight-indent-guides)
;;; siren-highlight-indent-guides.el ends here
