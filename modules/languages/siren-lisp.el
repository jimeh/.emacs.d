;;; siren-lisp.el --- jimeh's Emacs Siren: lisp-mode configuration.

;;; Commentary:

;; Basic configuration for lisp-mode.

;;; Code:

;; Lisp configuration
(define-key read-expression-map (kbd "TAB") 'completion-at-point)

;; wrap keybindings
(define-key lisp-mode-shared-map (kbd "M-(") (siren-wrap-with "("))
;; FIXME: Pick terminal-friendly binding.
;;(define-key lisp-mode-shared-map (kbd "M-[") (siren-wrap-with "["))
(define-key lisp-mode-shared-map (kbd "M-\"") (siren-wrap-with "\""))

;; a great lisp coding hook
(defun siren-lisp-coding-hook ())

;; interactive modes don't need whitespace checks
(defun siren-interactive-lisp-coding-hook ()
  (whitespace-mode -1))

(provide 'siren-lisp)
;;; siren-lisp.el ends here
