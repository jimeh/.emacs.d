;;; siren-smex.el --- jimeh's Emacs Siren: smex configuration.

;;; Commentary:

;; Replace M-x with the more powerful smex.

;;; Code:

(use-package smex
  :bind
  ("C-x C-m" . smex)
  ("C-c C-m" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command)

  :custom
  (smex-save-file (expand-file-name "smex-items" siren-cache-dir))

  :config
  (smex-initialize))

(provide 'siren-smex)
;;; siren-smex.el ends here
