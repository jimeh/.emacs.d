;;; siren-prescient.el --- jimeh's Emacs Siren: prescient configuration.

;;; Commentary:

;; Basic configuration for prescient.

;;; Code:

(use-package prescient
  :defer t

  :custom
  (prescient-filter-method '(literal regexp initialism fuzzy))
  (prescient-save-file (expand-file-name "prescient-save.el" siren-cache-dir)))

(provide 'siren-prescient)
;;; siren-prescient.el ends here
