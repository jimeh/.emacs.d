;;; siren-clang-format.el --- jimeh's Emacs Siren: clang-format configuration.

;;; Commentary:

;; Basic configuration for clang-format package

;;; Code:

(use-package clang-format
  :straight (:type built-in) ;; from vendor directory
  :defer t)

(provide 'siren-clang-format)
;;; siren-clang-format.el ends here
