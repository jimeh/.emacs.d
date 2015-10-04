;;
;; avy allows us to effectively navigate to visible things
;;

(siren-require-packages '(ace-window avy))

(require 'avy)
(require 'ace-window)

(setq avy-background t
      avy-style 'at-full)

(define-key global-map (kbd "C-c C-j") 'avy-goto-word-or-subword-1)
(define-key global-map (kbd "C-c SPC") 'avy-goto-char)
(define-key global-map (kbd "M-o") 'ace-window)


(provide 'siren-avy)