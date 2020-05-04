;;; siren-refine.el --- jimeh's Emacs Siren: refine configuration.

;;; Commentary:

;; Basic configuration for refine.

;;; Code:

(use-package refine
  :commands refine
  :bind
  (:map refine-mode-map
        ("M-n" . refine-move-forward)
        ("M-p" . refine-move-backward)))

(provide 'siren-refine)
;;; siren-refine.el ends here
