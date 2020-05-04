;;; siren-applescript.el --- jimeh's Emacs Siren: applescript-mode configuration.

;;; Commentary:

;; Basic configuration for applescript-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package applescript-mode
  :mode
  "\\.applescript\\'"
  "\\.scpt\\'"

  :hook (applescript-mode . siren-applescript-mode-setup)

  :init
  (defun siren-applescript-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq tab-width 4)

    (company-mode +1)
    (highlight-symbol-mode -1)
    (subword-mode +1)))

(provide 'siren-applescript)
;;; siren-applescript.el ends here
