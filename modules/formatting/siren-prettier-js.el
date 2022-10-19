;;; siren-prettier-js.el --- jimeh's Emacs Siren: prettier-js configuration.

;;; Commentary:

;; Basic configuration for prettier-js package

;;; Code:

(use-package prettier-js
  :defer t
  :hook (prettier-js-mode . siren-prettier-js-mode-setup)

  :preface
  (defun siren-prettier-js-mode-setup ())

  :config
  (let ((rc (expand-file-name "~/.prettierrc.js")))
    (if (file-exists-p rc)
        (setq prettier-js-args `("--config" ,rc)))))

(provide 'siren-prettier-js)
;;; siren-prettier-js.el ends here
