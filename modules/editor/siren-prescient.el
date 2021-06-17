;;; siren-prescient.el --- jimeh's Emacs Siren: prescient configuration.

;;; Commentary:

;; Basic configuration for prescient.

;;; Code:

(use-package prescient
  :defer t

  :custom
  (prescient-filter-method '(literal-prefix literal regexp initialism fuzzy))
  (prescient-history-length 100)
  (prescient-save-file (expand-file-name "prescient-save.el" siren-cache-dir))
  (prescient-sort-full-matches-first t)
  (prescient-sort-length-enable nil)

  :config
  (prescient-persist-mode +1))

(use-package company-prescient
  :defer t
  :after (prescient company)

  :config
  (company-prescient-mode +1))


(provide 'siren-prescient)
;;; siren-prescient.el ends here
