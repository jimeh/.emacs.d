;;; siren-php.el --- jimeh's Emacs Siren: php-mode configuration.

;;; Commentary:

;; Basic configuration for php-mode.

;;; Code:

(require 'siren-origami)
(require 'siren-prettier-js)
(require 'siren-rainbow)

(use-package php-mode
  :interpreter "php"
  :mode "\\.php\\'" "\\.inc\\'" "\\.module\\'"
  :hook
  (php-mode . siren-php-mode-setup)

  :preface
  (defun siren-php-mode-setup ()
    (prettier-js-mode t)
    (rainbow-mode t)
    (subword-mode t)
    (origami-mode t)))

(provide 'siren-php)
;;; siren-php.el ends here
