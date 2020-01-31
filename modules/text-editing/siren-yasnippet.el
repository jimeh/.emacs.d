;;; siren-yasnippet.el --- jimeh's Emacs Siren: yasnippet configuration.

;;; Commentary:

;; Basic configuration for yasnippet.

;;; Code:

(use-package yasnippet-snippets)

(use-package yasnippet
  :hook (after-init . yas-global-mode)
  :diminish yas-minor-mode)

(provide 'siren-yasnippet)
;;; siren-yasnippet.el ends here
