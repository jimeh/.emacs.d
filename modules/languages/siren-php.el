;;; siren-php.el --- jimeh's Emacs Siren: php-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for php-mode.

;;; Code:

(require 'siren-treesit)

(use-package php-mode
  :interpreter "php"
  :mode "\\.php\\'" "\\.inc\\'" "\\.module\\'"
  :hook
  (php-mode . siren-php-mode-setup)

  :preface
  (defun siren-php-mode-setup ()))

(when (fboundp 'php-ts-mode)
  (use-package php-ts-mode
    :straight (:type built-in)
    :interpreter "php"
    :mode "\\.php\\'" "\\.inc\\'" "\\.module\\'"
    :hook
    (php-ts-mode . siren-php-ts-mode-setup)

    :general
    (:keymaps 'php-ts-mode-map
              "C-j" 'newline-and-indent)

    :custom
    (php-ts-mode-indent-offset 2)

    :preface
    (defun siren-php-ts-mode-setup ())))

(provide 'siren-php)
;;; siren-php.el ends here
