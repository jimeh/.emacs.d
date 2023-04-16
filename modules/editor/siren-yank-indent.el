;;; siren-yank-indent.el --- jimeh's Emacs Siren: yank-indent configuration.

;;; Commentary:

;; Basic configuration for yank-indent.

;;; Code:

(use-package yank-indent
  :straight (:type built-in) ;; from vendor directory
  :demand

  :config
  (global-yank-indent-mode t))

(provide 'siren-yank-indent)
;;; siren-yank-indent.el ends here
