;;
;; sass
;;

(require 'siren-css)
(siren-require-packages '(sass-mode))

;; turn off annoying auto-compile on save
(setq sass-compile-at-save nil)

(defun siren-sass-mode-defaults ()
  (siren-css-mode-defaults))

(setq siren-sass-mode-hook 'siren-sass-mode-defaults)

(add-hook 'sass-mode-hook (lambda () (run-hooks 'siren-sass-mode-hook)))


(provide 'siren-sass)
