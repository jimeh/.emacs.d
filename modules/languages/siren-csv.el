;;; siren-csv.el --- jimeh's Emacs Siren: csv configuration.

;;; Commentary:

;; Replace M-x with the more powerful csv.

;;; Code:

(use-package csv-mode
  :hook
  (csv-mode . siren-csv-mode-setup)

  :general
  (:keymaps 'csv-mode-map
            "C-c C-h" 'csv-header-line)

  :custom
  (csv-align-max-width 50)
  (csv-align-min-width 1)
  (csv-align-padding 2)
  (csv-align-style 'auto)
  (csv-header-lines 1)
  (csv-invisibility-default t)

  :preface
  (defun siren-csv-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (csv-guess-set-separator)))

(provide 'siren-csv)
;;; siren-csv.el ends here
