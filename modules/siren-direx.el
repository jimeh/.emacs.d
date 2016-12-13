;;; siren-direx.el --- jimeh's Emacs Siren: direx configuration.

;;; Commentary:

;; Basic configuration for direx.

;;; Code:

(siren-require-packages '(direx))
(require 'direx)

(defun siren-direx-mode-defaults ()
  (setq direx:closed-icon " + ")
  (setq direx:open-icon " - "))

(setq siren-direx-mode-hook 'siren-direx-mode-defaults)

(add-hook 'direx-mode-hook (lambda ()
                             (run-hooks 'siren-direx-mode-hook)))

(global-set-key (kbd "C-x j") 'direx-project:jump-to-project-root)

(provide 'siren-direx)
;;; siren-direx.el ends here
