;;; siren-volatile-highlights.el --- jimeh's Emacs Siren: volatile-highlights-mode configuration.

;;; Commentary:

;; Basic configuration for volatile-highlights-mode.

;;; Code:

(require 'siren-undo-tree)

(use-package volatile-highlights
  :demand
  :diminish volatile-highlights-mode
  :config
  (volatile-highlights-mode t)
  (vhl/define-extension 'undo-tree 'undo-tree-yank 'undo-tree-move)
  (vhl/install-extension 'undo-tree))

(provide 'siren-volatile-highlights)
;;; siren-volatile-highlights.el ends here
