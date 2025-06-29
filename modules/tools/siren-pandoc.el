;;; siren-pandoc.el --- jimeh's Emacs Siren: pandoc-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for pandoc-mode.

;;; Code:

(use-package pandoc-mode
  :hook
  (markdown-mode . pandoc-mode))

(provide 'siren-pandoc)
;;; siren-pandoc.el ends here
