;;; siren-sort-symbols.el --- jimeh's Emacs Siren: sort-symbols.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Helper command to sort symbols in region. Shamelessly ripped from:
;; https://www.emacswiki.org/emacs/SortWords

;;; Code:

(defun sort-symbols (reverse beg end)
  "Sort symbols in region alphabetically, in REVERSE if negative.
See `sort-symbols'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\(\\sw\\|\\s_\\)+" "\\&" beg end))

(defalias 'ss 'sort-symbols)

(provide 'siren-sort-symbols)
;;; siren-sort-symbols.el ends here
