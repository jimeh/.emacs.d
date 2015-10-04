;;
;; scss
;;

(require 'siren-css)
(siren-require-packages '(scss-mode))

;; turn off annoying auto-compile on save
(setq scss-compile-at-save nil)

(defun siren-scss-mode-defaults ()
  (siren-css-mode-defaults))

(setq siren-scss-mode-hook 'siren-scss-mode-defaults)

(add-hook 'scss-mode-hook (lambda () (run-hooks 'siren-scss-mode-hook)))


(provide 'siren-scss)
