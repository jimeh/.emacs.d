;;; siren-flycheck.el --- jimeh's Emacs Siren: flycheck configuration.

;;; Commentary:

;; Basic configuration for flycheck.

;;; Code:

(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-completion-system 'ido
        flycheck-idle-change-delay 1.0
        flycheck-indication-mode 'right-fringe
        flycheck-ruby-rubocop-executable "rubocop-bundle-safe"
        flycheck-javascript-standard-executable "semistandard"))

(provide 'siren-flycheck)
;;; siren-flycheck.el ends here
