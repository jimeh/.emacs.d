;;; siren-vue.el --- jimeh's Emacs Siren: vue-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for vue-mode.

;;; Code:

(require 'siren-mmm)

(use-package vue-mode
  :hook
  (vue-mode . siren-vue-mode-setup)

  :preface
  (defun siren-vue-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (lsp-deferred)))

(provide 'siren-vue)
;;; siren-vue.el ends here
