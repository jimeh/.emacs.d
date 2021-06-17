;;; siren-flycheck.el --- jimeh's Emacs Siren: flycheck configuration.

;;; Commentary:

;; Basic configuration for flycheck.

;;; Code:

(use-package flycheck
  :hook
  (prog-mode . flycheck-mode)

  :custom
  (flycheck-idle-change-delay 1.0)
  (flycheck-indication-mode 'right-fringe)
  (flycheck-ruby-rubocop-executable "rubocop-bundle-safe")
  (flycheck-javascript-standard-executable "semistandard")

  :config
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
    [#b00000000
     #b00011000
     #b00110000
     #b01100000
     #b11000000
     #b01100000
     #b00110000
     #b00011000] nil nil nil))

(provide 'siren-flycheck)
;;; siren-flycheck.el ends here
