;;; siren-yasnippet.el --- jimeh's Emacs Siren: yasnippet configuration.

;;; Commentary:

;; Basic configuration for yasnippet.

;;; Code:

(use-package yasnippet
  :diminish yas-minor-mode

  :config
  (yas-global-mode)
  (yas-reload-all))

(use-package yasnippet-snippets
  :after yasnippet)

(provide 'siren-yasnippet)
;;; siren-yasnippet.el ends here
