;;; siren-amx.el --- jimeh's Emacs Siren: amx configuration.

;;; Commentary:

;; Replace M-x with the more powerful amx.

;;; Code:

(require 'siren-ido)

(use-package amx
  :general
  ("M-x" 'amx)
  ("C-x C-m" 'amx)
  ("s-P" 'amx)

  :custom
  (amx-backend 'ido)
  (amx-histroy-lenth 15)
  (amx-prompt-string "M-x ")
  (amx-save-file (siren-cache-dir "amx-items"))
  (amx-show-key-bindings t)

  :config
  (amx-mode +1))

(provide 'siren-amx)
;;; siren-amx.el ends here
