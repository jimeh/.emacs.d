;;; siren-orderless.el --- jimeh's Emacs Siren: orderless configuration.

;;; Commentary:

;; Basic configuration for orderless.

;;; Code:

(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-overrides '((file (styles . (partial-completion)))))
  (orderless-matching-styles '(orderless-literal
                               orderless-prefixes
                               orderless-regexp
                               orderless-initialism
                               orderless-flex)))

(provide 'siren-orderless)
;;; siren-orderless.el ends here
