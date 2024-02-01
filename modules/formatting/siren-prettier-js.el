;;; siren-prettier-js.el --- jimeh's Emacs Siren: prettier-js configuration.

;;; Commentary:

;; Basic configuration for prettier-js package

;;; Code:

(use-package prettier-js
  :defer t
  :hook
  ((conf-toml-mode
    css-mode
    markdown-mode
    nxml-mode
    php-mode
    typescript-mode
    toml-mode
    toml-ts-mode
    vue-mode) . siren-prettier-js-mode-enable)

  :custom
  (prettier-js-command "prettier-pnp")
  (prettier-js-args '("--quiet"
                      "--pnp" "prettier-plugin-toml"))

  :preface
  (defun siren-prettier-js-mode-enable ()
    (prettier-js-mode t))

  :config
  (let ((rc (expand-file-name "~/.prettierrc.js")))
    (if (file-exists-p rc)
        (add-to-list 'prettier-js-args `("--config" ,rc)))))

(provide 'siren-prettier-js)
;;; siren-prettier-js.el ends here
