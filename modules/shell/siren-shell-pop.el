;;; siren-shell-pop.el --- jimeh's Emacs Siren: shell-pop configuration.

;;; Commentary:

;; Basic configuration for shell-pop.

;;; Code:

(require 'siren-vterm)

(use-package shell-pop
  :bind
  ("C-`" . shell-pop)

  :custom
  (shell-pop-full-span t)
  (shell-pop-shell-type '("vterm" "*vterm*"
                          (lambda nil (vterm shell-pop-term-shell))))
  (shell-pop-universal-key "C-`")
  (shell-pop-window-position "bottom")
  (shell-pop-window-size 40))

(provide 'siren-shell-pop)
;;; siren-shell-pop.el ends here
