;;; siren-prog-mode.el --- jimeh's Emacs Siren: defaults for programming modes

;;; Commentary:

;; Basic configuration shared across all programming languages.

;;; Code:

(require 'siren-display-indentation)

(use-package prog-mode
  :straight (:type built-in)
  :hook
  (prog-mode . siren-prog-mode-setup)

  :init
  (defun siren-prog-mode-setup ()
    "Default coding hook, useful with any programming language."
    (setq fill-column 80
          whitespace-action '(auto-cleanup))

    (siren-display-indentation 1)
    (visual-line-mode t)
    (whitespace-mode t)))

(provide 'siren-prog-mode)
;;; siren-prog-mode.el ends here
