;;; siren-cucumber.el --- jimeh's Emacs Siren: feature-mode configuration.

;;; Commentary:

;; Basic configuration for feature-mode.

;;; Code:

(require 'siren-fci)
(require 'siren-flyspell)
(require 'siren-linum)
(require 'siren-prog-mode)
(require 'siren-flycheck)
(require 'siren-highlight-indentation)
(require 'siren-highlight-symbol)
(require 'siren-smartparens)

(use-package feature-mode
  :mode "\\.feature\\'"
  :interpreter "cucumber"
  :hook (feature-mode . siren-feature-mode-setup)

  :init
  (defun siren-feature-mode-setup ()
    (siren-prog-mode-setup)
    (setq tab-width 2)

    (fci-mode)
    (flycheck-mode)
    (flyspell-prog-mode)
    (highlight-indentation-current-column-mode)
    (highlight-indentation-set-offset 2)
    (highlight-symbol-mode)
    (linum-mode)
    (smartparens-mode)))

(provide 'siren-cucumber)
;;; siren-cucumber.el ends here
