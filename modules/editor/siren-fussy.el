;;; siren-fussy.el --- jimeh's Emacs Siren: fussy configuration.  -*- lexical-binding: nil; -*-

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
  (fussy-score-fn #'fussy-flx-rs-score)

  :config
  (flx-rs-load-dyn))

(provide 'siren-fussy)
;;; siren-fussy.el ends here
