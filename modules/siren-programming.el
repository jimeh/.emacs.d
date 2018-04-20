;;; siren-programming.el --- jimeh's Emacs Siren: defaults for programming modes

;;; Commentary:

;; Basic configuration shared across all programming languages.

;;; Code:

(require 'siren-fci)
(require 'siren-flycheck)
(require 'siren-flyspell)
(require 'siren-smartparens)
(require 'siren-highlight-indentation)
(require 'siren-highlight-symbol)

(defun siren-prog-mode-setup ()
  "Default coding hook, useful with any programming language."
  (setq fill-column 80)
  (linum-mode t)
  (flyspell-prog-mode)
  (flycheck-mode +1)
  (fci-mode)
  (smartparens-mode +1)
  (highlight-symbol-mode)
  (setq whitespace-action '(auto-cleanup))
  (visual-line-mode +1)
  (whitespace-mode +1))

(add-hook 'prog-mode-hook #'siren-prog-mode-setup)

(provide 'siren-programming)
;;; siren-programming.el ends here
