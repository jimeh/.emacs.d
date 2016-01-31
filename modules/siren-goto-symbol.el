;;; siren-goto-symbol.el --- jimeh's Emacs Siren: goto-symbol.

;;; Commentary:

;; Basic goto-symbol functionality.

;;; Code:

;; Shamelessly ripped from Emacs Prelude.

(require 'imenu)
(set-default 'imenu-auto-rescan t)
(set-default 'imenu-max-item-length 160)
(set-default 'imenu-max-items 400)

(defun siren-flush-cache-and-goto-symbol ()
  "Flush imenu cache."
  (interactive)
  (setq imenu--index-alist nil)
  (siren-goto-symbol))

(defun siren-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (cond
   ((not symbol-list)
    (let (name-and-pos symbol-names position)
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (siren-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (completing-read "Symbol? " (reverse symbol-names)))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))
      (recenter)))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (siren-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names (substring-no-properties name))
          (add-to-list 'name-and-pos (cons (substring-no-properties name)
                                           position))))))))


(global-set-key (kbd "C-t") 'siren-goto-symbol)
(global-set-key (kbd "C-c C-t") 'siren-flush-cache-and-goto-symbol)

(provide 'siren-goto-symbol)
;;; siren-goto-symbol ends here.
