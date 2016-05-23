;;; siren-dockerfile.el --- jimeh's Emacs Siren: dockerfile-mode configuration.

;;; Commentary:

;; Basic configuration for dockerfile-mode.

;;; Code:

(require 'siren-programming)
(siren-require-packages '(dockerfile-mode))

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(defun siren-dockerfile-mode-defaults ()
  (siren-prog-mode-defaults)
  (subword-mode +1))

(setq siren-dockerfile-mode-hook 'siren-dockerfile-mode-defaults)

(add-hook 'dockerfile-mode-hook (lambda ()
                                  (run-hooks 'siren-dockerfile-mode-hook)))

(provide 'siren-dockerfile)
;;; siren-dockerfile.el ends here
