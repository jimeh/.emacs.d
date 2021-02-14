;;; siren-sql.el --- jimeh's Emacs Siren: sql-mode configuration.

;;; Commentary:

;; Basic configuration for sql-mode.

;;; Code:

(require 'siren-rainbow)

(use-package sql-mode
  :straight (:type built-in)
  :mode "\\.sql\\'"
  :hook (sql-mode . siren-sql-mode-setup)

  :init
  (defun siren-sql-mode-setup ()
    (setq tab-width 2)

    (company-mode +1)))

(use-package sqlformat
  :hook
  (sql-mode . sqlformat-on-save-mode)

  :custom
  (sqlformat-args '("-g"))
  (sqlformat-command 'pgformatter))

(provide 'siren-sql)
;;; siren-sql.el ends here
