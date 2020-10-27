;;; siren-yasnippet.el --- jimeh's Emacs Siren: yasnippet configuration.

;;; Commentary:

;; Basic configuration for yasnippet.

;;; Code:

(use-package yasnippet
  :diminish yas-minor-mode
  :hook
  (emacs-startup . yas-global-mode)

  :config
  (yas-reload-all))

(use-package yasnippet-snippets
  :defer t
  :after (yasnippet))

(provide 'siren-yasnippet)
;;; siren-yasnippet.el ends here
