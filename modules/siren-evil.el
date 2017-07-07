;;; siren-evil.el --- jimeh's Emacs Siren: evil configuration.

;;; Commentary:

;; Basic configuration for evil.

;;; Code:

(siren-require-packages '(evil))

(require 'evil)

;; Various evil config options borrowed from:
;; http://www.lukeswart.net/2015/04/lightning-intro-to-emacs-using-evil-mode-and-org-mode/

;; Treat wrapped line scrolling as single lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; esc quits pretty much anything (like pending prompts in the minibuffer)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(provide 'siren-evil)
;;; siren-evil.el ends here
