;;; siren-text-manipulation.el --- jimeh's Emacs Siren: text-manipulation.

;;; Commentary:

;; Various text manipulation functions and keybindings. Some of them shamelessly
;; ripped from textmate.el: https://github.com/defunkt/textmate.el

;;; Code:

(siren-require-packages '(move-dup expand-region smart-shift))

(require 'move-dup)
(require 'expand-region)

(require 'smart-shift)
(global-smart-shift-mode 1)

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

;; Keybindings
(global-set-key (kbd "M-p") 'md/move-lines-up)
(global-set-key (kbd "M-n") 'md/move-lines-down)
;; (global-set-key (kbd "C-x C-d") 'md/duplicate-up)
(global-set-key (kbd "C-x C-d") 'md/duplicate-down)

(global-set-key (kbd "C-c [") 'smart-shift-left)
(global-set-key (kbd "C-c ]") 'smart-shift-right)
(global-set-key (kbd "M-[") 'smart-shift-left)
(global-set-key (kbd "M-]") 'smart-shift-right)

(global-set-key (kbd "C-c /") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "M-.") 'er/expand-region)
(global-set-key (kbd "M-,") 'er/contract-region)

(provide 'siren-text-manipulation)
;;; siren-text-manipulation.el ends here
