;;; siren-flycheck.el --- jimeh's Emacs Siren: flycheck configuration.

;;; Commentary:

;; Basic configuration for flycheck.

;;; Code:

(siren-require-packages '(flycheck))

(require 'flycheck)
(setq flycheck-completion-system 'ido)
(setq flycheck-idle-change-delay 1.0)
(setq flycheck-indication-mode 'right-fringe)
(setq flycheck-ruby-rubocop-executable "rubocop-bundle-safe")
(setq flycheck-javascript-standard-executable "semistandard")

(provide 'siren-flycheck)
;;; siren-flycheck.el ends here
