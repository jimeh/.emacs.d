;;; siren-avy.el --- jimeh's Emacs Siren: avy configuration.

;;; Commentary:

;; Basic configuration for avy. Avy allows us to effectively navigate to visible
;; things.

;;; Code:

(siren-require-packages '(ace-window avy))

(require 'avy)
(require 'ace-window)

(setq avy-background t
      avy-style 'at-full)

(define-key global-map (kbd "C-c C-j") 'avy-goto-word-or-subword-1)
(define-key global-map (kbd "C-c SPC") 'avy-goto-char)
(define-key global-map (kbd "M-o") 'ace-window)

(provide 'siren-avy)
;;; siren-avy.el ends here
