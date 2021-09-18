;;; siren-ssh-config.el --- jimeh's Emacs Siren: ssh-config-mode configuration.

;;; Commentary:

;; Basic configuration for ssh-config-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package ssh-config-mode
  :mode "/ssh/config\\'"
  :hook (ssh-config-mode . siren-ssh-config-mode-setup)

  :init
  (defun siren-ssh-config-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq tab-width 2)))

(provide 'siren-ssh-config)
;;; siren-ssh-config.el ends here
