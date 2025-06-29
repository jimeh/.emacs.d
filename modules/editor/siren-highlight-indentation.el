;;; siren-highlight-indentation.el --- jimeh's Emacs Siren: highlight-indentation-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for highlight-indentation-mode.

;;; Code:

(use-package highlight-indentation
  :defer t
  :diminish (highlight-indentation-mode
             highlight-indentation-current-column-mode))

(provide 'siren-highlight-indentation)
;;; siren-highlight-indentation.el ends here
