;;; siren-refine.el --- jimeh's Emacs Siren: refine configuration.

;;; Commentary:

;; Basic configuration for refine.

;;; Code:

(use-package refine
  :commands refine
  :general
  (:keymaps 'refine-mode-map
            "q" (lambda () (interactive) (kill-this-buffer))
            "M-n" 'refine-move-forward
            "M-p" 'refine-move-backward))

(provide 'siren-refine)
;;; siren-refine.el ends here
