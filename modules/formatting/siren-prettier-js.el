;;; siren-prettier-js.el --- jimeh's Emacs Siren: prettier-js configuration.

;;; Commentary:

;; Basic configuration for prettier-js package

;;; Code:

(use-package prettier-js
  :defer t
  :hook
  ((css-mode
    css-ts-mode
    markdown-mode
    php-mode
    php-ts-mode
    scss-mode
    tsx-ts-mode
    typescript-mode
    typescript-ts-mode
    vue-mode) . siren-prettier-js-mode-enable)

  :custom
  (prettier-js-command "prettier-pnp")
  (prettier-js-args '("--quiet"
                      "--pnp" "@prettier/plugin-php"
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
