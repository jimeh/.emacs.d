;;
;; Setup a few global command aliases
;;

;; Text Manipulation
(defalias 'rs 'replace-string)
(defalias 'qr 'query-replace-regexp)
(defalias 'al 'align-regexp)
(defalias 'sl 'sort-lines)
(defalias 'rr 'reverse-region)

(defalias 'lml 'list-matching-lines)
(defalias 'dml 'delete-matching-lines)
(defalias 'dnml 'delete-non-matching-lines)
(defalias 'dtw 'delete-trailing-whitespace)

;; Buffer Manipulation
(defalias 'rb 'revert-buffer)

;; Emacs Lisp
(defalias 'eb 'eval-buffer)
(defalias 'er 'eval-region)
(defalias 'ed 'eval-defun)
(defalias 'eis 'elisp-index-search)
(defalias 'lf 'load-file)

;; Dired
(defalias 'wd 'wdired-change-to-wdired-mode)
