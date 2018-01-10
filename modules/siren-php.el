;;; siren-php.el --- jimeh's Emacs Siren: php-mode configuration.

;;; Commentary:

;; Basic configuration for php-mode.

;;; Code:

(require 'siren-programming)
(require 'siren-rainbow)

(use-package php-mode
  :config
  (defun siren-php-mode-defaults ()
    (siren-prog-mode-defaults)
    (rainbow-mode +1)
    (company-mode +1)
    (subword-mode +1)
    (highlight-indentation-current-column-mode)
    (hs-minor-mode 1)
    (hideshowvis-enable))

  (setq siren-php-mode-hook 'siren-php-mode-defaults)
  (add-hook 'php-mode-hook (lambda ()
                             (run-hooks 'siren-php-mode-hook))))

(provide 'siren-php)
;;; siren-php.el ends here
