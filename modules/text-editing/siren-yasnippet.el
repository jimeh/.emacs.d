;;; siren-yasnippet.el --- jimeh's Emacs Siren: yasnippet configuration.

;;; Commentary:

;; Basic configuration for yasnippet.

;;; Code:

(use-package yasnippet-snippets
  :defer t)

(use-package yasnippet
  :hook (emacs-startup . yas-global-mode)
  :diminish yas-minor-mode)

(provide 'siren-yasnippet)
;;; siren-yasnippet.el ends here
