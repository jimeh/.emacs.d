;;; siren-conf.el --- jimeh's Emacs Siren: conf-mode configuration.

;;; Commentary:

;; Basic configuration for conf-mode.

;;; Code:

(require 'siren-display-indentation)
(require 'siren-fci)
(require 'siren-flyspell)
(require 'siren-linum)
(require 'siren-prog-mode)
(require 'siren-flycheck)
(require 'siren-highlight-symbol)
(require 'siren-smartparens)

(use-package conf-mode
  :mode "Procfile\\'" "\\.conf\\'" "\\.cfg\\'"
  :hook (conf-mode . siren-conf-mode-setup)

  :init
  (defun siren-conf-mode-setup ()
    (siren-prog-mode-setup)
    (setq tab-width 2)

    (siren-display-indentation)
    (fci-mode)
    (flycheck-mode)
    (flyspell-prog-mode)
    (highlight-symbol-mode)
    (linum-mode)
    (smartparens-mode)))

(provide 'siren-conf)
;;; siren-conf.el ends here
