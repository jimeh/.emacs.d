;;; siren-sort-words.el --- jimeh's Emacs Siren: sort-words.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Helper command to sort words in region. Shamelessly ripped from:
;; https://www.emacswiki.org/emacs/SortWords

;;; Code:

(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
Prefixed with negative \\[universal-argument], sorts in reverse.

The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.

See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(defalias 'sw 'sort-words)

(provide 'siren-sort-words)
;;; siren-sort-words.el ends here
