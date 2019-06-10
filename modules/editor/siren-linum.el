;;; siren-linum.el --- jimeh's Emacs Siren: linum configuration.

;;; Commentary:

;; Basic configuration for linum.

;;; Code:

(use-package linum
  :ensure nil ;; loaded from emacs built-ins

  :hook
  (prog-mode . linum-mode))

(use-package linum+
  :ensure nil ;; loaded from vendor
  :after linum

  :custom
  ;; Customize line numbers - In GUI mode the fringe is the spacer between line
  ;; numbers and code, while in console mode we add an extra space for it.
  (linum+-dynamic-format (if window-system " %%%dd" " %%%dd "))

  :config
  (setq linum-format 'dynamic))

(provide 'siren-linum)
;;; siren-linum.el ends here
