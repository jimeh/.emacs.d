;;; siren-conf.el --- jimeh's Emacs Siren: conf-mode configuration.

;;; Commentary:

;; Basic configuration for conf-mode.

;;; Code:

(require 'siren-programming)

(use-package conf-mode
  :mode "Procfile\\'" "\\.conf\\'" "\\.cfg\\'"
  :hook (conf-mode . siren-conf-mode-setup)

  :init
  (defun siren-conf-mode-setup ()
    (siren-prog-mode-setup)
    (setq tab-width 2)
    (highlight-indentation-set-offset 2)
    (highlight-indentation-current-column-mode)))

(provide 'siren-conf)
;;; siren-conf.el ends here
