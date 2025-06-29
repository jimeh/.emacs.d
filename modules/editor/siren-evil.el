;;; siren-evil.el --- jimeh's Emacs Siren: evil configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for evil.

;;; Code:

;; Various evil config options borrowed from:
;; http://www.lukeswart.net/2015/04/lightning-intro-to-emacs-using-evil-mode-and-org-mode/
(use-package evil
  :demand
  :general
  (:keymaps 'evil-normal-state-map
            ;; Treat wrapped line scrolling as single lines.
            "j" 'evil-next-visual-line
            "k" 'evil-previous-visual-line)
  ;; esc quits pretty much anything (like pending prompts in the minibuffer)
  (:keymaps 'evil-normal-state-map "<escape>" 'keyboard-quit)
  (:keymaps 'evil-visual-state-map "<escape>" 'keyboard-quit)
  (:keymaps 'minibuffer-local-map "<escape>" 'minibuffer-keyboard-quit)
  (:keymaps 'minibuffer-local-ns-map "<escape>" 'minibuffer-keyboard-quit)
  (:keymaps 'minibuffer-local-completion-map "<escape>" 'minibuffer-keyboard-quit)
  (:keymaps 'minibuffer-local-must-match-map "<escape>" 'minibuffer-keyboard-quit)
  (:keymaps 'minibuffer-local-isearch-map "<escape>" 'minibuffer-keyboard-quit))


(provide 'siren-evil)
;;; siren-evil.el ends here
