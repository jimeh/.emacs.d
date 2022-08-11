;;; siren-fussy.el --- jimeh's Emacs Siren: fussy configuration.

;;; Commentary:

;; Basic configuration for fussy.

;;; Code:

(use-package flx-rs
  :straight (flx-rs :repo "jcs-elpa/flx-rs" :fetcher github
                    :files (:defaults "bin"))
  :config
  (with-eval-after-load 'consult
    (defun siren-flx-rs-score-consult-fix (orig-fun str query &rest args)
      "Fix input string provided by consult to be compatible with flx-rs.

Some commands that use consult seem to add metadata to candidates
in the form of some extra bytes at the end of the string. These
extra bytes causes flx-rs to not match against it correctly.

Consult uses the `invisible' text property to mark these extra
bytes so that they are not displayed to the user in completion
frameworks.

This function attempts to extract the original input string by
looking for where the `invisible' text property begins, and
grabbing all text before it."
      (let ((end (next-single-property-change 0 'invisible str)))
        (apply orig-fun (if end (substring str 0 end) str) query args)))

    (advice-add 'flx-rs-score :around 'siren-flx-rs-score-consult-fix))

  (flx-rs-load-dyn))

(use-package fussy
  :demand t
  :custom
  (completion-category-overrides nil)
  (completion-ignore-case t)
  (pcomplete-ignore-case t)

  (fussy-ignore-case t)
  (fussy-filter-fn 'fussy-filter-default)
  (fussy-score-fn 'flx-rs-score)

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



(provide 'siren-fussy)
;;; siren-fussy.el ends here
