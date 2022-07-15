;;; siren-prog-mode.el --- jimeh's Emacs Siren: defaults for programming modes

;;; Commentary:

;; Basic configuration shared across all programming languages.

;;; Code:

(require 'siren-display-indentation)

(use-package prog-mode
  :straight (:type built-in)
  :hook
  (prog-mode . siren-prog-mode-setup)

  :preface
  (defun siren-prog-mode-setup ()
    "Default coding hook, useful with any programming language."
    (setq-local fill-column 80)

    ;; Highlight indentation if we are not indenting with real tabs.
    (if (not indent-tabs-mode)
        (siren-display-indentation 1))

    (hl-line-mode t)
    (whitespace-mode t))

  :init
  (add-to-list 'safe-local-variable-values '(fill-column . 120)))

(provide 'siren-prog-mode)
;;; siren-prog-mode.el ends here
