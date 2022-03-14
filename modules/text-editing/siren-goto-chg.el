;;; siren-goto-chg.el --- jimeh's Emacs Siren: goto-chg configuration.

;;; Commentary:

;; Basic configuration for goto-chg.

;;; Code:

(use-package goto-chg
  :general
  ("C-." 'goto-last-change)
  ("C-," 'goto-last-change-reverse))

(provide 'siren-goto-chg)
;;; siren-goto-chg.el ends here
