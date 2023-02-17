;;; siren-ssh-config.el --- jimeh's Emacs Siren: ssh-config-mode configuration.

;;; Commentary:

;; Basic configuration for ssh-config-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package ssh-config-mode
  :mode
  "/\\.local/ssh/config\\(\\.d/.*\\.conf\\)?\\'"

  :hook
  (ssh-config-mode . siren-ssh-config-mode-setup)
  (ssh-known-hosts-mode . siren-ssh-config-mode-setup)

  :preface
  (defun siren-ssh-config-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq-local tab-width 2)))

(provide 'siren-ssh-config)
;;; siren-ssh-config.el ends here
