;;; siren-helm-command.el --- jimeh's Emacs Siren: helm-command.

;;; Commentary:

;; Configure helm-command.

;;; Code:

(require 'siren-helm)

(use-package helm-command
  :ensure helm
  :defer t
  :bind
  ("M-x" . helm-M-x)

  :config
  (setq helm-M-x-always-save-history t
        helm-M-x-fuzzy-match t))

(provide 'siren-helm-command)
;;; siren-helm-command.el ends here
