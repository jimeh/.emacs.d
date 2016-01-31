;;; siren-programming.el --- jimeh's Emacs Siren: defaults for programming modes

;;; Commentary:

;; Basic configuration shared across all programming languages.

;;; Code:

(require 'siren-fci)
(require 'siren-flycheck)
(require 'siren-smartparens)
(require 'siren-highlight-indentation)
(require 'siren-highlight-symbol)

(defun siren-prog-mode-defaults ()
  "Default coding hook, useful with any programming language."
  (setq fill-column 80)
  (linum-mode t)
  (flyspell-prog-mode)
  (fci-mode)
  (smartparens-mode +1)
  (highlight-symbol-mode)
  (setq whitespace-action (quote (auto-cleanup)))
  (visual-line-mode +1)
  (whitespace-mode +1))

(setq siren-prog-mode-hook 'siren-prog-mode-defaults)

(add-hook 'prog-mode-hook (lambda ()
                            (run-hooks 'siren-prog-mode-hook)))

;; enable on-the-fly syntax checking
(if (fboundp 'global-flycheck-mode)
    (global-flycheck-mode +1)
  (add-hook 'prog-mode-hook 'flycheck-mode))


(provide 'siren-programming)
;;; siren-programming.el ends here
