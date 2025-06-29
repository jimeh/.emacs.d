;;; siren-orderless.el --- jimeh's Emacs Siren: orderless configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for orderless.

;;; Code:

(use-package orderless
  :custom
  (completion-ignore-case t)
  (pcomplete-ignore-case t)
  (completion-styles '(orderless))
  (orderless-matching-styles '(orderless-literal
                               orderless-prefixes
                               orderless-regexp
                               orderless-initialism
                               orderless-flex))

  :init
  (with-eval-after-load 'selectrum
    (setq selectrum-refine-candidates-function #'orderless-filter)
    (setq selectrum-highlight-candidates-function #'orderless-highlight-matches))

  :config
  (setf (alist-get 'styles
                   (alist-get 'file completion-category-overrides))
        '(partial-completion)))

(provide 'siren-orderless)
;;; siren-orderless.el ends here
