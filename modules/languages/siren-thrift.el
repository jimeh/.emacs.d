;;; siren-thrift.el --- jimeh's Emacs Siren: thrift-mode configuration.

;;; Commentary:

;; Basic configuration for thrift-mode.

;;; Code:

(require 'siren-fci)
(require 'siren-flyspell)
(require 'siren-linum)
(require 'siren-prog-mode)
(require 'siren-flycheck)
(require 'siren-highlight-indentation)
(require 'siren-highlight-symbol)
(require 'siren-smartparens)

(use-package thrift
  :mode "\\.thrift\\'"
  :hook (thrift-mode . siren-thrift-mode-setup)

  :init
  (defun siren-thrift-mode-setup ()
    (siren-prog-mode-setup)
    (setq tab-width 2)

    (fci-mode)
    (flycheck-mode)
    (flyspell-prog-mode)
    (highlight-indentation-current-column-mode)
    (highlight-indentation-set-offset 2)
    (highlight-symbol-mode)
    (linum-mode)
    (smartparens-mode)
    (subword-mode +1)))

(provide 'siren-thrift)
;;; siren-thrift.el ends here
