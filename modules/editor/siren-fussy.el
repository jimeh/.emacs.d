;;; siren-fussy.el --- jimeh's Emacs Siren: fussy configuration.

;;; Commentary:

;; Basic configuration for fussy.

;;; Code:

(use-package fussy
  :ensure t
  :custom
  (completion-category-overrides nil)
  (completion-ignore-case t)
  (pcomplete-ignore-case t)

  (fussy-ignore-case t)
  (fussy-filter-fn 'fussy-filter-orderless-flex)
  (fussy-score-fn 'fussy-fzf-native-score)

  :preface
  (defun siren-fussy--company-transform-advice (f &rest args)
    "Manage `company-transformers'."
    (let ((company-transformers '(fussy-company-sort-by-completion-score)))
      (apply f args)))

  :config
  (add-to-list 'completion-styles 'fussy)
  (advice-add 'company--transform-candidates
              :around 'siren-fussy--company-transform-advice)
  (setq completion-category-defaults nil))

(use-package orderless
  :commands (orderless-filter))

(use-package fzf-native
  :straight (fzf-native :repo "dangduc/fzf-native" :host github
                        :files (:defaults "bin"))
  :config
  (fzf-native-load-dyn))

(provide 'siren-fussy)
;;; siren-fussy.el ends here
