;;; siren-php.el --- jimeh's Emacs Siren: php-mode configuration.

;;; Commentary:

;; Basic configuration for php-mode.

;;; Code:

(require 'siren-folding)
(require 'siren-prettier-js)
(require 'siren-rainbow)
(require 'siren-tree-sitter)

(use-package php-mode
  :interpreter "php"
  :mode "\\.php\\'" "\\.inc\\'" "\\.module\\'"
  :hook
  (php-mode . siren-php-mode-setup)

  :preface
  (defun siren-php-mode-setup ()
    (tree-sitter-mode +1)
    (prettier-js-mode)
    (rainbow-mode +1)
    (subword-mode +1)
    (siren-folding)))

(provide 'siren-php)
;;; siren-php.el ends here
