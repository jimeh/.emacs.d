;;; siren-yank-indent.el --- jimeh's Emacs Siren: yank-indent configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for yank-indent.

;;; Code:

(use-package yank-indent
  :ensure (:host github :repo "jimeh/yank-indent")

  :config
  (global-yank-indent-mode t))

(provide 'siren-yank-indent)
;;; siren-yank-indent.el ends here
