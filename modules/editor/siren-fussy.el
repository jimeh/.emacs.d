;;; siren-fussy.el --- jimeh's Emacs Siren: fussy configuration.

;;; Commentary:

;; Basic configuration for fussy.

;;; Code:

(use-package flx-rs
  :straight (flx-rs :repo "jcs-elpa/flx-rs" :fetcher github
                    :files (:defaults "bin"))
  :preface
  (defun siren-flx-rs-score-consult-buffer-fix (orig-fun str query &rest args)
    "Fix input string provided by consult-buffer to be compatible with flx-rs.

Consult buffer adds some extra bytes at the end of input
candidates which causes flx-rs to not match some inputs
correctly. This function will attempt to extract buffer name from
text properties added by consult-buffer, or fallback on the input
string as provided."
    (let* ((props (text-properties-at 0 str))
           (buffer (if props (alist-get 'buffer props))))
      (apply orig-fun (or buffer str) query args)))

  :config
  (advice-add 'flx-rs-score :around 'siren-flx-rs-score-consult-buffer-fix)
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
