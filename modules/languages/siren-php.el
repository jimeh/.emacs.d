;;; siren-php.el --- jimeh's Emacs Siren: php-mode configuration.

;;; Commentary:

;; Basic configuration for php-mode.

;;; Code:

(require 'siren-folding)
(require 'siren-rainbow)

(use-package php-mode
  :interpreter "php"
  :mode "\\.php\\'" "\\.inc\\'" "\\.module\\'"
  :hook
  (php-mode . siren-php-mode-setup)

  :init
  (defun siren-php-mode-setup ()
    (rainbow-mode +1)
    (company-mode +1)
    (subword-mode +1)
    (hs-minor-mode 1)
    (hideshowvis-enable)))

(provide 'siren-php)
;;; siren-php.el ends here
