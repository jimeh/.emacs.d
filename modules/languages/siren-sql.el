;;; siren-sql.el --- jimeh's Emacs Siren: sql-mode configuration.

;;; Commentary:

;; Basic configuration for sql-mode.

;;; Code:

(require 'siren-rainbow)

(use-package sql-mode
  :ensure nil ;; loaded from emacs built-ins
  :mode "\\.sql\\'"
  :hook (sql-mode . siren-sql-mode-setup)

  :init
  (defun siren-sql-mode-setup ()
    (setq tab-width 2)

    (company-mode +1)
    (highlight-indentation-current-column-mode +1)))

(use-package sqlformat
  :hook
  (sql-mode . sqlformat-mode)

  :config
  (setq sqlformat-command 'pgformatter))

(provide 'siren-sql)
;;; siren-sql.el ends here
