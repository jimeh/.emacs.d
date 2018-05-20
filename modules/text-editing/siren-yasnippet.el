;;; siren-yasnippet.el --- jimeh's Emacs Siren: yasnippet configuration.

;;; Commentary:

;; Basic configuration for yasnippet.

;;; Code:

(use-package yasnippet-snippets)

(use-package yasnippet
  :demand
  :diminish yas-minor-mode
  :config
  (yas-global-mode t))

(provide 'siren-yasnippet)
;;; siren-yasnippet.el ends here
