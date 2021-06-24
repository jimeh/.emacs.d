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
                               orderless-flex))

  :init
  (with-eval-after-load 'selectrum
    (setq selectrum-refine-candidates-function #'orderless-filter)
    (setq selectrum-highlight-candidates-function #'orderless-highlight-matches)))

(provide 'siren-orderless)
;;; siren-orderless.el ends here
