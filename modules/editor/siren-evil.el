;;; siren-evil.el --- jimeh's Emacs Siren: evil configuration.

;;; Commentary:

;; Basic configuration for evil.

;;; Code:

;; Various evil config options borrowed from:
;; http://www.lukeswart.net/2015/04/lightning-intro-to-emacs-using-evil-mode-and-org-mode/
(use-package evil
  :demand
  :bind (:map evil-normal-state-map
              ;; Treat wrapped line scrolling as single lines.
              ("j" . evil-next-visual-line)
              ("k" . evil-previous-visual-line)
              ;; esc quits pretty much anything (like pending prompts in the minibuffer)
              :map evil-normal-state-map ("<escape>" . keyboard-quit)
              :map evil-visual-state-map ("<escape>" . keyboard-quit)
              :map minibuffer-local-map ("<escape>" . minibuffer-keyboard-quit)
              :map minibuffer-local-ns-map ("<escape>" . minibuffer-keyboard-quit)
              :map minibuffer-local-completion-map ("<escape>" . minibuffer-keyboard-quit)
              :map minibuffer-local-must-match-map ("<escape>" . minibuffer-keyboard-quit)
              :map minibuffer-local-isearch-map ("<escape>" . minibuffer-keyboard-quit)))

(provide 'siren-evil)
;;; siren-evil.el ends here
