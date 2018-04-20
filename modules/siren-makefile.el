;;; siren-makefile.el --- jimeh's Emacs Siren: makefile-mode configuration.

;;; Commentary:

;; Basic configuration for makefile-mode.

;;; Code:

(require 'siren-programming)

(add-to-list 'siren-indent-sensitive-modes 'makefile-mode)

(defun siren-makefile-mode-setup ()
  (siren-prog-mode-setup)
  (subword-mode)
  (setq tab-width 4)
  (highlight-indentation-set-offset 4)
  (highlight-indentation-current-column-mode))

(add-hook 'makefile-mode-hook #'siren-makefile-mode-setup)

(provide 'siren-makefile)
;;; siren-makefile.el ends here
