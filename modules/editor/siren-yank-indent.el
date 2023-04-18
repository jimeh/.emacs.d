;;; siren-yank-indent.el --- jimeh's Emacs Siren: yank-indent configuration.

;;; Commentary:

;; Basic configuration for yank-indent.

;;; Code:

(use-package yank-indent
  :straight (:host github :repo "jimeh/yank-indent")

  :config
  (global-yank-indent-mode t))

(provide 'siren-yank-indent)
;;; siren-yank-indent.el ends here
