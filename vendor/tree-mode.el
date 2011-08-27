;;; tree-mode.el --- A mode to create and manage tree widgets
;; Copyright 2007 Ye Wenbin
;;
;; Author: wenbinye@163.com
;; Version: $Id: tree-mode.el,v 1.3 2007/02/17 06:37:54 ywb Exp ywb $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'tree-mode)

;;; Code:

(provide 'tree-mode)
(require 'tree-widget)
(eval-when-compile
  (require 'cl))

(defvar tree-mode-list nil)

(defvar tree-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map widget-keymap)
    (define-key map "p" 'tree-mode-previous-node)
    (define-key map "n" 'tree-mode-next-node)
    (define-key map "j" 'tree-mode-next-sib)
    (define-key map "k" 'tree-mode-previous-sib)
    (define-key map "u" 'tree-mode-goto-parent)
    (define-key map "r" 'tree-mode-goto-root)
    (define-key map "g" 'tree-mode-reflesh)
    (define-key map "e" 'tree-mode-expand-level)
    (define-key map "!" 'tree-mode-collapse-other-except)
    (dotimes (i 10)
      (define-key map `[,(+ ?0 i)] 'digit-argument))
    map))

(defvar tree-mode-insert-tree-hook nil
  "Hooks run after insert a tree into buffer. Each function is
passed the new tree created")

(defvar tree-mode-delete-tree-hook nil
  "Hooks run after delete a tree in the buffer. Each function is
passed the new tree created")

(defun tree-mode-reflesh-tree (tree)
  (if (widget-get tree :dynargs)
      (widget-put tree :args nil)
    (if (widget-get tree :old-args)
        (widget-put tree :args (widget-get tree :old-args))))
  (widget-value-set tree (widget-value tree)))

(defun tree-mode-reflesh-parent (widget &rest ignore)
  "Put this function to :notify property of tree-widget node."
  (tree-mode-reflesh-tree (widget-get widget :parent)))

(define-derived-mode tree-mode nil "Tree"
  "A mode to manage many tree widgets"
  (make-local-variable 'tree-mode-list)
  (make-local-variable 'tree-mode-insert-tree-hook)
  (make-local-variable 'tree-mode-delete-tree-hook)
  (widget-setup))

(add-hook 'tree-widget-before-create-icon-functions
          'tree-mode-icon-create)
(defun tree-mode-icon-create (icon)
  (let ((img (widget-get (widget-get icon :node) :button-icon)))
    (if img (widget-put icon :glyph-name img))))

(defun tree-mode-insert (tree &optional before)
  (if before
      (goto-char (widget-get before :from))
    (goto-char (point-max)))
  (setq tree (widget-create tree))
  (setq tree-mode-list (append tree-mode-list (list tree)))
  (run-hook-with-args 'tree-mode-insert-tree-hook tree)
  tree)

(defun tree-mode-delete (tree)
  (setq tree-mode-list (delq tree tree-mode-list))
  (widget-delete tree)
  (run-hook-with-args 'tree-mode-delete-tree-hook tree))

(defun tree-mode-tree-buffer (tree)
  (marker-buffer (widget-get tree :from)))

(defun tree-mode-kill-buffer (&rest ignore)
  (if (= (length tree-mode-list) 0)
      (kill-buffer (current-buffer))))

;;{{{  Predicate and others
(defun tree-mode-root-treep (tree)
  (and (tree-widget-p tree)
       (null (widget-get tree :parent))))

(defun tree-mode-tree-linep ()
  "If there is tree-widget in current line, return t."
  (let ((wid (tree-mode-icon-current-line)))
    (and wid (not (tree-widget-leaf-node-icon-p wid)))))

(defun tree-mode-root-linep ()
  "If the root tree node in current line, return t"
  (let ((wid (tree-mode-icon-current-line)))
    (and wid (not (tree-widget-leaf-node-icon-p wid))
         (null (widget-get (widget-get wid :parent) :parent)))))

(defun tree-mode-icon-current-line ()
  "Return the icon widget in current line"
  (save-excursion
    (forward-line 0)
    (or (widget-at)
        (progn (widget-forward 1)
               (widget-at)))))

(defun tree-mode-button-current-line ()
  (widget-at (1- (line-end-position))))

(defun tree-mode-parent-current-line ()
  "If current line is root line, return the root tree, otherwise
return the parent tree"
  (let ((wid (tree-mode-icon-current-line))
        parent)
    (when wid
      (if (tree-widget-leaf-node-icon-p wid)
          (widget-get wid :parent)
        (setq parent (widget-get (widget-get wid :parent) :parent))
        (or parent (widget-get wid :parent))))))

(defun tree-mode-widget-root (wid)
  (let (parent)
    (while (setq parent (widget-get wid :parent))
      (setq wid parent))
    wid))

(defun tree-mode-tree-ap (&optional pos)
  "Return the root tree at point"
  (save-excursion
    (if pos (goto-char pos))
    (tree-mode-widget-root (tree-mode-icon-current-line))))
;;}}}

;;{{{  Movement commands
(defun tree-mode-next-node (arg)
  (interactive "p")
  (widget-forward (* arg 2)))

(defun tree-mode-previous-node (arg)
  (interactive "p")
  (tree-mode-next-node (- arg)))

(defun tree-mode-next-sib (arg)
  (interactive "p")
  (let (me siblings sib others out-range)
    (if (tree-mode-root-linep)
        (setq me (tree-mode-tree-ap)
              siblings tree-mode-list)
      (let ((parent (tree-mode-parent-current-line)))
        (setq me (tree-mode-button-current-line))
        (if (tree-mode-tree-linep)
            (setq me (widget-get me :parent)))
        (setq siblings (widget-get parent :children))))
    (setq others (member me siblings))
    (if (> arg 0)
        (setq sib
              (if (>= arg (length others))
                  (progn
                    (setq out-range t)
                    (car (last others)))
                (nth arg others)))
      (setq sib (- (length siblings)
                   (length others)
                   (- arg))
            out-range (< sib 0))
      (setq sib (nth (max 0 sib) siblings)))
    (goto-char (widget-get sib :from))
    (if out-range
        (message "No %s sibling more!" (if (< arg 0) "previous" "next")))))

(defun tree-mode-previous-sib (arg)
  (interactive "p")
  (tree-mode-next-sib (- arg)))

(defun tree-mode-goto-root ()
  (interactive)
  (let ((root (tree-mode-tree-ap)))
    (if root
        (goto-char (widget-get root :from))
      (message "No Root!"))))

(defun tree-mode-goto-parent (arg)
  (interactive "p")
  (let ((parent (tree-mode-parent-current-line)))
    (setq arg (1- arg))
    (if parent
        (progn
          (goto-char (widget-get parent :from))
          (while (and (> arg 0)
                      (setq parent (widget-get parent :parent))
                      (goto-char (widget-get parent :from))
                      (setq arg (1- arg)))))
      (message "No parent!"))))
;;}}}

;;{{{  Expand or collapse
(defun tree-mode-collapse-other-except ()
  (interactive)
  (let ((me (tree-mode-icon-current-line)))
    (if (tree-widget-leaf-node-icon-p me)
        (message "Not a tree under point!")
      (setq me (widget-get me :parent))
      (unless (widget-get me :open)
        (widget-apply-action me))
      (mapc (lambda (tree)
              (if (widget-get tree :open)
                  (widget-apply-action tree)))
            (remq me (if (tree-mode-root-treep me)
                         tree-mode-list
                       (widget-get (widget-get me :parent)
                                   :children)))))))

(defun tree-mode-collapse-children (tree)
  (mapc (lambda (child)
          (if (widget-get child :open)
              (widget-apply-action child)))
        (widget-get tree :children)))

(defun tree-mode-expand-children (tree)
  (mapc (lambda (child)
          (if (and (tree-widget-p child)
                   (not (widget-get child :open)))
              (widget-apply-action child)))
        (widget-get tree :children)))

(defun tree-mode-expand-level (level)
  "Expand tree to LEVEL. With prefix argument 0 or negative, will
expand all leaves of the tree."
  (interactive "p")
  (let ((me (tree-mode-icon-current-line)))
    (if (tree-widget-leaf-node-icon-p me)
        (message "Not a tree under point!")
      (setq me (widget-get me :parent))
      (tree-mode-expand-level-1 me (1- level)))))

(defun tree-mode-expand-level-1 (tree level)
  (when (tree-widget-p tree)
    (if (not (widget-get tree :open))
        (widget-apply-action tree))
    (if (= level 0)
        (tree-mode-collapse-children tree)
      (mapc (lambda (child)
              (tree-mode-expand-level-1 child (1- level)))
            (widget-get tree :children)))))
;;}}}

(defun tree-mode-node-tag (node)
  (or (widget-get node :tag)
      (widget-get (widget-get node :node) :tag)))

;;{{{  Commands about tree nodes
(defun tree-mode-backup-args (widget)
  (unless (and (widget-get widget :dynargs)
               (null (widget-get widget :old-args)))
    ;; if widget don't have a dynamic args function
    ;; restore args to old-args for recover
    (widget-put widget :old-args (copy-sequence (widget-get widget :args)))))

(defun tree-mode-filter-children (widget filter)
  (tree-mode-backup-args widget)
  (widget-put widget :args
              (delq nil (mapcar (lambda (child)
                                  (if (funcall filter child)
                                      child))
                                (widget-get widget :args))))
  (widget-value-set widget (widget-value widget)))

(defun tree-mode-sort-by-nchild (wid1 wid2)
  "Sort node by which node has children"
  (widget-get wid1 :children))

(defun tree-mode-sort-children (widget sorter)
  (tree-mode-backup-args widget)
  (widget-put widget :args
              (sort (copy-sequence (widget-get widget :args)) sorter))
  (widget-value-set widget (widget-value widget)))

(defun tree-mode-sort-by-tag (arg)
  (interactive "P")
  (let ((tree (tree-mode-parent-current-line)))
    (if tree
        (tree-mode-sort-children tree
                                 (lambda (w1 w2)
                                   (or (tree-mode-sort-by-nchild w1 w2)
                                       (string< (tree-mode-node-tag w1)
                                                (tree-mode-node-tag w2)))))
      (message "No tree at point!"))))

(defun tree-mode-delete-match (regexp)
  (interactive "sDelete node match: ")
  (let ((tree (tree-mode-parent-current-line)))
    (if tree
        (tree-mode-filter-children
         tree
         (lambda (child) (not (string-match regexp (tree-mode-node-tag child)))))
      (message "No tree at point!"))))

(defun tree-mode-keep-match (regexp)
  (interactive "sKeep node match: ")
  (let ((tree (tree-mode-parent-current-line)))
    (if tree
        (tree-mode-filter-children
         tree
         (lambda (child) (string-match regexp (tree-mode-node-tag child))))
      (message "No tree at point!"))))

(defun tree-mode-reflesh ()
  "Reflesh parent tree."
  (interactive)
  (let ((tree (tree-mode-parent-current-line)))
    (if tree
        (tree-mode-reflesh-tree tree)
      (message "No tree at point!"))))

(defun tree-mode-delete-tree ()
  "Delete a tree from buffer."
  (interactive)
  (if (tree-mode-root-linep)
      (if (yes-or-no-p "Delete current tree? ")
          (tree-mode-delete (tree-mode-tree-ap)))
    (message "No tree at point!")))
;;}}}

;;; tree-mode.el ends here
