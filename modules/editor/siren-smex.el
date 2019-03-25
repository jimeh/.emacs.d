;;; siren-smex.el --- jimeh's Emacs Siren: smex.

;;; Commentary:

;; Replace M-x with the more powerful smex.

;;; Code:

(use-package smex
  :bind
  ("C-x C-m" . smex)
  ("C-c C-m" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command)

  :config
  (setq smex-save-file (expand-file-name "smex-items" siren-cache-dir))
  (smex-initialize))

(provide 'siren-smex)
;;; siren-smex.el ends here
