;;; siren-symbol-overlay.el --- jimeh's Emacs Siren: symbol-overlay configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for symbol-overlay.

;;; Code:

(use-package symbol-overlay
  :diminish symbol-overlay-mode

  :general
  ("C-c i" 'symbol-overlay-put)
  ("C-c C-p" 'symbol-overlay-jump-prev)
  ("C-c C-n" 'symbol-overlay-jump-next)

  :hook
  (prog-mode . symbol-overlay-mode)

  :custom
  (symbol-overlay-idle-time 0.5)

  :preface
  (defvar ruby-block-beg-keywords)
  (defvar ruby-modifier-beg-keywords)
  (defvar ruby-block-mid-keywords)
  (defvar ruby-block-op-keywords)
  (defun siren-symbol-overlay-ignore-function-ruby (symbol)
    "Determine whether SYMBOL should be ignored (Ruby)."
    (or (symbol-overlay-match-keyword-list symbol '("end"))
        (symbol-overlay-match-keyword-list symbol ruby-block-beg-keywords)
        (symbol-overlay-match-keyword-list symbol ruby-modifier-beg-keywords)
        (symbol-overlay-match-keyword-list symbol ruby-block-mid-keywords)
        (symbol-overlay-match-keyword-list symbol ruby-block-op-keywords)))

  :config
  (add-to-list 'symbol-overlay-ignore-functions
               '(ruby-mode . siren-symbol-overlay-ignore-function-ruby)))

(provide 'siren-symbol-overlay)
;;; siren-symbol-overlay.el ends here
