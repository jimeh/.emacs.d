;;; siren-smex.el --- jimeh's Emacs Siren: smex configuration.

;;; Commentary:

;; Replace M-x with the more powerful smex.

;;; Code:

(use-package smex
  :general
  ("C-x C-m" 'smex)
  ("s-P" 'smex)
  ("M-X" 'smex-major-mode-commands)
  ("C-c C-c M-x" 'execute-extended-command)

  :custom
  (smex-save-file (siren-cache-dir "smex-items"))

  :config
  (smex-initialize))

(provide 'siren-smex)
;;; siren-smex.el ends here
