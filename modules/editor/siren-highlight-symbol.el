;;; siren-highlight-symbol.el --- jimeh's Emacs Siren: highlight-symbol configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for highlight-symbol.

;;; Code:

(use-package highlight-symbol
  :diminish highlight-symbol-mode

  :general
  ("C-c C-p" 'highlight-symbol-prev)
  ("C-c C-n" 'highlight-symbol-next)
  ("C-c C-r" 'highlight-symbol-query-replace)

  :hook
  (prog-mode . highlight-symbol-mode)

  :custom
  (highlight-symbol-highlight-single-occurrence 'nil)
  (highlight-symbol-idle-delay 0.5)
  (highlight-symbol-ignore-list '("^end$" "^def$" "^class$" "^module$")))

(provide 'siren-highlight-symbol)
;;; siren-highlight-symbol.el ends here
