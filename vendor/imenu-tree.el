;;; imenu-tree.el --- A mode to view imenu using tree-widget

;; Copyright 2007 Ye Wenbin
;;
;; Author: wenbinye@163.com
;; Version: $Id: imenu-tree.el,v 1.2 2007/02/16 14:36:10 ywb Exp ywb $
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
;;   (require 'imenu-tree)

;;; Code:

(provide 'imenu-tree)
(eval-when-compile
  (require 'cl))

(require 'imenu)
(require 'tree-mode)

(defgroup imenu-tree nil
  "Display imenu using tree-widget"
  :group 'convenience)

(defcustom imenu-tree-create-buffer-function nil
  "A function to create buffer for insert imenu tree"
  :group 'imenu-tree
  :type 'function)

(defcustom imenu-tree-name `(concat mode-name ": " (or (buffer-name) "<NIL>"))
  "tree imenu root name"
  :group 'imenu-tree
  :type 'sexp)

(defvar imenu-tree-window-width 40)

(defvar imenu-tree-icons
  '(("Types" . "function")))

(defcustom imenu-tree-window-function
  (lambda (trbuf buf)
    (delete-other-windows)
    (let* ((w1 (selected-window))
           (w2 (split-window w1 imenu-tree-window-width t)))
        (set-window-buffer w1 trbuf)
        (set-window-buffer w2 buf)
        (other-window 1)
        ))
  "Function to set the window buffer display"
  :group 'imenu-tree
  :type 'function)

(defvar imenu-tree-buffer nil)
(defvar imenu-tree nil)

(define-derived-mode imenu-tree-mode tree-mode "Imenu-Tree"
  "A mode to display tree of imenu"
  (tree-widget-set-theme "imenu")
  (add-hook 'tree-mode-delete-tree-hook 'tree-mode-kill-buffer))

(defun imenu-tree (arg)
  "Display a tree of IMENU. With prefix argument, select imenu
tree buffer window."
  (interactive "P")
  (let ((old-tree (and (local-variable-p 'imenu-tree) imenu-tree))
        (buf (current-buffer))
        tree)
    (if (and (local-variable-p 'imenu-tree-buffer)
             (buffer-live-p imenu-tree-buffer))
        (with-current-buffer imenu-tree-buffer
          (if (and old-tree (member old-tree tree-mode-list))
              (setq tree old-tree)
            (setq tree (tree-mode-insert (imenu-tree-widget buf)))))
      (let ((buffer (if (functionp imenu-tree-create-buffer-function)
                        (funcall imenu-tree-create-buffer-function buf)
                      (get-buffer-create "*imenu-tree*"))))
        (set (make-local-variable 'imenu-tree-buffer) buffer)
        (add-hook 'kill-buffer-hook 'imenu-tree-kill nil t)
        (with-current-buffer buffer
          (unless (eq major-mode 'imenu-tree-mode)
            (imenu-tree-mode))
          (setq tree (tree-mode-insert (imenu-tree-widget buf))))))
    (set (make-local-variable 'imenu-tree) tree)
    ;; if imenu-tree-buffer is visible, do nothing
    (unless (get-buffer-window imenu-tree-buffer)
      (switch-to-buffer imenu-tree-buffer)
      (funcall imenu-tree-window-function (current-buffer) buf))
    (let ((win (get-buffer-window imenu-tree-buffer)))
      (with-selected-window win
        (unless (widget-get tree :open)
          (widget-apply-action tree))
        (goto-char (widget-get tree :from))
        (recenter 1))
      (if arg
          (select-window (get-buffer-window imenu-tree-buffer))))))

(defun imenu-tree-kill ()
  (let ((tree imenu-tree))
    (when (and imenu-tree-buffer
               (buffer-live-p imenu-tree-buffer))
      (with-current-buffer imenu-tree-buffer
        (tree-mode-delete tree)))))

(defun imenu-tree-widget (buf)
  `(tree-widget
    :node (push-button
           :tag ,(with-current-buffer buf
                   (eval imenu-tree-name))
           :format "%[%t%]\n"
           :notify tree-mode-reflesh-parent)
    :dynargs imenu-tree-expand
    :has-children t
    :buffer ,buf
    :open t))

(defun imenu-tree-select (node &rest ignore)
  (let ((marker (widget-get node :imenu-marker)))
    (select-window (display-buffer (marker-buffer marker)))
    (goto-char marker)))

(defun imenu-tree-expand-bucket (bucket)
  (let ((name (widget-get (widget-get bucket :node) :tag))
        (tree (widget-get bucket :parent)))
    (mapcar (lambda (item)
              `(push-button
                :tag ,(car item)
                :imenu-marker ,(cdr item)
                :format "%[%t%]\n"
                :button-icon ,(or (assoc-default name imenu-tree-icons)
                                  "other")
                :notify imenu-tree-select))
            (cdr (assoc name (with-current-buffer (widget-get tree :buffer)
                               imenu--index-alist))))))

(defun imenu-tree-expand (tree)
  (or (widget-get tree :args)
      (let* ((buf (widget-get tree :buffer))
             (imenu-auto-rescan t)
             (idx (save-excursion
                    (set-buffer buf)
                    (reverse (imenu--make-index-alist t))))
             widgets)
        (dolist (item idx)
          (if (listp (cdr item))
              (push `(tree-widget
                      :node (push-button
                             :tag ,(car item)
                             :button-icon "bucket"
                             :notify tree-mode-reflesh-parent
                             :format "%[%t%]\n")
                      :dynargs imenu-tree-expand-bucket
                      :has-children t)
                    widgets)
            (unless (and (string= "*Rescan*" (car item))
                         (numberp (cdr item)))
              (push `(push-button
                      :tag ,(car item)
                      :imenu-marker ,(cdr item)
                      :button-icon "function"
                      :format "%[%t%]\n"
                      :notify imenu-tree-select)
                    widgets))))
        widgets)))

(defun imenu-tree-display ()
  (interactive)
  (let ((widget (widget-at (1- (line-end-position))))
        marker)
    (if (setq marker (widget-get widget :imenu-marker))
        (with-selected-window (display-buffer (marker-buffer marker))
          (goto-char marker)))))

(define-key imenu-tree-mode-map "\C-o" 'imenu-tree-display)

;;; imenu-tree.el ends here
