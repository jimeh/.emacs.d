;;; siren-makefile.el --- jimeh's Emacs Siren: makefile-mode configuration.

;;; Commentary:

;; Basic configuration for makefile-mode.

;;; Code:

(require 'siren-programming)

(add-to-list 'siren-yank-indent-modes 'makefile-mode)

(defun siren-makefile-mode-defaults ()
  (siren-prog-mode-defaults)
  (subword-mode)
  (setq tab-width 4)
  (highlight-indentation-set-offset 4)
  (highlight-indentation-current-column-mode))

(setq siren-makefile-mode-hook 'siren-makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'siren-makefile-mode-hook)))

(provide 'siren-makefile)
;;; siren-makefile.el ends here
