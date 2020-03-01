;;; siren-amx.el --- jimeh's Emacs Siren: amx configuration.

;;; Commentary:

;; Replace M-x with the more powerful amx.

;;; Code:

(require 'siren-ivy)

(use-package amx
  :bind
  ("M-x" . amx)
  ("C-x C-m" . amx)
  ("C-c C-m" . amx)
  ("C-c C-c M-x" . execute-extended-command)

  :custom
  (amx-backend 'ivy)
  (amx-histroy-lenth 15)
  (amx-prompt-string "M-x ")
  (amx-save-file (expand-file-name "amx-items" siren-cache-dir))
  (amx-show-key-bindings t)

  :config
  (amx-mode +1))

(provide 'siren-amx)
;;; siren-amx.el ends here
