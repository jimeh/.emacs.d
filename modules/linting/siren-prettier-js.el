;;; siren-prettier-js.el --- jimeh's Emacs Siren: prettier-js configuration.

;;; Commentary:

;; Basic configuration for prettier-js package

;;; Code:

(use-package prettier-js
  :defer t
  :hook (prettier-js-mode . siren-prettier-js-mode-setup)

  :init
  (defun siren-prettier-js-mode-setup ()))

(provide 'siren-prettier-js)
;;; siren-prettier-js.el ends here
