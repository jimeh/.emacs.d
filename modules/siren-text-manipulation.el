;;
;; text-manipulation
;;

(siren-require-packages '(move-text expand-region))

(require 'move-text)
(require 'expand-region)

;; Various things shamelessly ripped from textmate.el:
;;  - https://github.com/defunkt/textmate.el

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

(defun siren-shift-right (&optional arg)
  "Shift the line or region to the ARG places to the right.
A place is considered `tab-width' character columns."
  (interactive)
  (let ((deactivate-mark nil)
        (beg (or (and mark-active (region-beginning))
                 (line-beginning-position)))
        (end (or (and mark-active (region-end)) (line-end-position))))
    (indent-rigidly beg end (* (or arg 1) tab-width))))

(defun siren-shift-left (&optional arg)
  "Shift the line or region to the ARG places to the left."
  (interactive)
  (siren-shift-right (* -1 (or arg 1))))


;; Keybindings
(define-key global-map (kbd "M-p") 'move-text-up)
(define-key global-map (kbd "M-n") 'move-text-down)

(global-set-key (kbd "C-c [") 'siren-shift-left)
(global-set-key (kbd "C-c ]") 'siren-shift-right)

(global-set-key (kbd "C-c /") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "M-.") 'er/expand-region)
(global-set-key (kbd "M-,") 'er/contract-region)


(provide 'siren-text-manipulation)
