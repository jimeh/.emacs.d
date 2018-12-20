;;; siren-smex.el --- jimeh's Emacs Siren: smex.

;;; Commentary:

;; Replace M-x with the more powerful smex.

;;; Code:

(use-package smex
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command)

  :config
  (setq smex-save-file (expand-file-name ".smex-items" siren-savefile-dir))
  (smex-initialize))

(provide 'siren-smex)
;;; siren-smex.el ends here
