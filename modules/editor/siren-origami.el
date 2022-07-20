;;; siren-origami.el --- jimeh's Emacs Siren: origami configuration.

;;; Commentary:

;; Basic configuration for origami code.

;;; Code:

(use-package origami
  :general
  (:keymaps 'origami-mode-map
            "M-0" 'origami-open-all-nodes
            "M-9" 'origami-close-all-nodes
            "C-=" 'origami-forward-toggle-node
            "C-c C-h" 'origami-forward-toggle-node))

(use-package lsp-origami
  :after lsp-mode)

(provide 'siren-origami)
;;; siren-origami.el ends here
