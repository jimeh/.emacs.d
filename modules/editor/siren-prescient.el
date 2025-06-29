;;; siren-prescient.el --- jimeh's Emacs Siren: prescient configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for prescient.

;;; Code:

(use-package prescient
  :defer t

  :custom
  (prescient-filter-method '(literal-prefix literal regexp initialism fuzzy))
  (prescient-history-length 100)
  (prescient-save-file (siren-cache-dir "prescient-save.el"))
  (prescient-sort-full-matches-first t)
  (prescient-sort-length-enable nil)

  :config
  (prescient-persist-mode +1))

(provide 'siren-prescient)
;;; siren-prescient.el ends here
