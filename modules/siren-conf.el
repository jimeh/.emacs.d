;;; siren-conf.el --- jimeh's Emacs Siren: conf-mode configuration.

;;; Commentary:

;; Basic configuration for conf-mode.

;;; Code:

(siren-require-packages '(conf-mode))

(require 'siren-programming)

(defun siren-conf-mode-defaults ()
  (siren-prog-mode-defaults)
  (setq tab-width 2)
  (highlight-indentation-set-offset 2)
  (highlight-indentation-current-column-mode))

(setq siren-conf-mode-hook 'siren-conf-mode-defaults)

(add-hook 'conf-mode-hook (lambda () (run-hooks 'siren-conf-mode-hook)))

(provide 'siren-conf)
;;; siren-conf.el ends here
