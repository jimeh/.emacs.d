;;; siren-yasnippet.el --- jimeh's Emacs Siren: yasnippet configuration.

;;; Commentary:

;; Basic configuration for yasnippet.

;;; Code:

(siren-require-packages '(yasnippet))

(require 'yasnippet)
(diminish 'yas-minor-mode)

(yas/global-mode t)

(provide 'siren-yasnippet)
;;; siren-yasnippet.el ends here
