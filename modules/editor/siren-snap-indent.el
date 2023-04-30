;;; siren-snap-indent.el --- jimeh's Emacs Siren: snap-indent configuration.

;;; Commentary:

;; Basic configuration for snap-indent.

;;; Code:

(use-package snap-indent
  :hook
  (prog-mode . snap-indent-mode)
  (tex-mode . snap-indent-mode)

  :custom
  (snap-indent-yank-threshold 10000)
  (snap-indent-yank-skip-indent-with-prefix-arg t))

(provide 'siren-snap-indent)
;;; siren-snap-indent.el ends here
