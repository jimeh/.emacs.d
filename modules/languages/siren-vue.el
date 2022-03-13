;;; siren-vue.el --- jimeh's Emacs Siren: vue-mode configuration.

;;; Commentary:

;; Basic configuration for vue-mode.

;;; Code:

(require 'siren-prettier-js)
(require 'siren-mmm)

(use-package vue-mode
  :hook
  (vue-mode . siren-vue-mode-setup)

  :init
  (defun siren-vue-mode-setup ()
    (prettier-js-mode)
    (lsp-deferred)
    (subword-mode)
    (siren-folding)))

(provide 'siren-vue)
;;; siren-vue.el ends here
