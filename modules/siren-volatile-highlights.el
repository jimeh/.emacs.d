;;; siren-volatile-highlights.el --- jimeh's Emacs Siren: volatile-highlights-mode configuration.

;;; Commentary:

;; Basic configuration for volatile-highlights-mode.

;;; Code:

(use-package volatile-highlights-mode
  :demand
  :diminish volatile-highlights-mode
  :config
  (volatile-highlights-mode t))

(provide 'siren-volatile-highlights)
;;; siren-volatile-highlights.el ends here
