;;; siren-prog-mode.el --- jimeh's Emacs Siren: defaults for programming modes

;;; Commentary:

;; Basic configuration shared across all programming languages.

;;; Code:

(use-package prog-mode
  :ensure nil ;; loaded from emacs built-ins
  :hook
  (prog-mode . siren-prog-mode-setup)

  :init
  (defun siren-prog-mode-setup ()
    "Default coding hook, useful with any programming language."
    (setq fill-column 80
          whitespace-action '(auto-cleanup))

    (visual-line-mode +1)
    (whitespace-mode +1)))

(provide 'siren-prog-mode)
;;; siren-prog-mode.el ends here
