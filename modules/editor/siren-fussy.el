;;; siren-fussy.el --- jimeh's Emacs Siren: fussy configuration.

;;; Commentary:

;; Basic configuration for fussy.

;;; Code:

(use-package fussy
  :demand t
  :custom
  (completion-category-overrides nil)
  (completion-ignore-case t)
  (pcomplete-ignore-case t)

  (fussy-ignore-case t)
  (fussy-filter-fn 'fussy-filter-default)
  (fussy-remove-bad-char-fn #'fussy-without-tofu-char)

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

(use-package flx-rs
  :straight (flx-rs :repo "jcs-elpa/flx-rs" :fetcher github
                    :files (:defaults "bin"))

  :custom
  (fussy-score-fn #'siren-flx-rs-score)

  :preface
  (defun siren-flx-rs-score (str query &rest args)
    "Score STR for QUERY using `flx-rs-score'.

This will no longer be needed when used with fussy after this PR
is merged: https://github.com/jojojames/fussy/pull/36"
    (flx-rs-score (funcall fussy-remove-bad-char-fn str) query args))

  :config
  (flx-rs-load-dyn))

(provide 'siren-fussy)
;;; siren-fussy.el ends here
