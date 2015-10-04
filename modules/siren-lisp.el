;;
;; lisp
;;

(require 'siren-programming)
(siren-require-packages '(rainbow-delimiters))

;; Lisp configuration
(define-key read-expression-map (kbd "TAB") 'completion-at-point)

;; wrap keybindings
(define-key lisp-mode-shared-map (kbd "M-(") (siren-wrap-with "("))
;; FIXME: Pick terminal-friendly binding.
;;(define-key lisp-mode-shared-map (kbd "M-[") (siren-wrap-with "["))
(define-key lisp-mode-shared-map (kbd "M-\"") (siren-wrap-with "\""))

;; a great lisp coding hook
(defun siren-lisp-coding-defaults ()
  ;; (smartparens-strict-mode +1)
  (rainbow-delimiters-mode +1)
  )

(setq siren-lisp-coding-hook 'siren-lisp-coding-defaults)

;; interactive modes don't need whitespace checks
(defun siren-interactive-lisp-coding-defaults ()
  ;; (smartparens-strict-mode +1)
  (rainbow-delimiters-mode +1)
  (whitespace-mode -1))

(setq siren-interactive-lisp-coding-hook 'siren-interactive-lisp-coding-defaults)


(provide 'siren-lisp)
