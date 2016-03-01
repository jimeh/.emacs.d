;;; siren-jsx.el --- jimeh's Emacs Siren: .jsx file configuration

;;; Commentary:

;; Basic configuration for dealing with .jsx files.

;;; Code:

(require 'siren-web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(provide 'siren-jsx)
;;; siren-jsx.el ends here
