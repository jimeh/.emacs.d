;;; siren-dockerfile.el --- jimeh's Emacs Siren: dockerfile-mode configuration.

;;; Commentary:

;; Basic configuration for dockerfile-mode.

;;; Code:

(use-package dockerfile-mode
  :mode "Dockerfile\\'"

  :config
  (require 'siren-programming)

  (defun siren-dockerfile-mode-defaults ()
    (siren-prog-mode-defaults)
    (subword-mode +1))

  (setq siren-dockerfile-mode-hook 'siren-dockerfile-mode-defaults)
  (add-hook 'dockerfile-mode-hook (lambda ()
                                    (run-hooks 'siren-dockerfile-mode-hook))))

(provide 'siren-dockerfile)
;;; siren-dockerfile.el ends here
