;;; siren-text-manipulation.el --- jimeh's Emacs Siren: text-manipulation.

;;; Commentary:

;; Various text manipulation functions and keybindings. Some of them shamelessly
;; ripped from textmate.el: https://github.com/defunkt/textmate.el

;;; Code:

(use-package move-dup
  :bind
  ("M-p" . md/move-lines-up)
  ("M-n" . md/move-lines-down)
  ("C-x C-d" . md/duplicate-down))

(use-package expand-region
  :bind
  ("M-." . er/expand-region)
  ("M-," . er/contract-region))

(use-package smart-shift
  :bind
  ("C-c [" . smart-shift-left)
  ("C-c ]" . smart-shift-right)
  ("M-[" . smart-shift-left)
  ("M-]" . smart-shift-right))

(defmacro allow-line-as-region-for-function (orig-function)
`(defun ,(intern (concat (symbol-name orig-function) "-or-line"))
   ()
   ,(format "Like `%s', but acts on the current line if mark is not active."
            orig-function)
   (interactive)
   (if mark-active
       (call-interactively (function ,orig-function))
     (save-excursion
       ;; define a region (temporarily) -- so any C-u prefixes etc. are preserved.
       (beginning-of-line)
       (set-mark (point))
       (end-of-line)
       (call-interactively (function ,orig-function))))))

(unless (fboundp 'comment-or-uncomment-region-or-line)
  (allow-line-as-region-for-function comment-or-uncomment-region))

;; from: https://www.emacswiki.org/emacs/RandomizeBuffer
(defun randomize-region (beg end)
  "Randomize lines in region from BEG to END."
  (interactive "*r")
  (let ((lines (split-string
                (delete-and-extract-region beg end) "\n")))
    (when (string-equal "" (car (last lines 1)))
      (setq lines (butlast lines 1)))
    (apply 'insert
           (mapcar 'cdr
                   (sort (mapcar
                          (lambda (x) (cons (random) (concat x "\n"))) lines)
                         (lambda (a b) (< (car a) (car b))))))))

;; from: https://www.emacswiki.org/emacs/SortWords
(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
Prefixed with negative \\[universal-argument], sorts in reverse.

The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.

See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(global-set-key (kbd "C-c /") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region-or-line)

(defalias 'sw 'sort-words)

(provide 'siren-text-manipulation)
;;; siren-text-manipulation.el ends here
