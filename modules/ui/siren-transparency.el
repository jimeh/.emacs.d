;;; siren-transparency.el --- jimeh's Emacs Siren: Emacs Frame transparency.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic helpers and configuration for frame transparency.

;;; Code:

(require 'siren-ui)

(defgroup siren-transparency nil
  "Options for the Siren transparency."
  :group 'siren-ui)

(defcustom siren-transparency-default-level 99
  "The default frame transparency level for Emacs frames."
  :type 'number
  :set (lambda (symbol value)
         (set-default symbol value)
         (setf (alist-get 'alpha default-frame-alist) value))
  :group 'siren)

(defun siren-transparency-decrease ()
  "Decrease level of transparency for the current frame."
  (interactive)
  (let ((current (or (frame-parameter nil 'alpha) 100)))
    (if (> current 0)
        (let ((new-level (+ current -1)))
          (siren-transparency new-level)
          (message "Frame transparency set to %s" new-level))
      (message "This is a minimum value of transparency!"))))

(defun siren-transparency-increase ()
  "Increase level of transparency for the current frame."
  (interactive)
  (let ((current (or (frame-parameter nil 'alpha) 100)))
    (if (< current 100)
        (let ((new-level (+ current +1)))
          (siren-transparency new-level)
          (message "Frame transparency set to %s" new-level))
      (message "This is a minimum value of transparency!"))))

(defun siren-transparency (num)
  "Set level of transparency for the current frame by providing NUM."
  (interactive "nEnter transparency level in range 0-100: ")
  (set-frame-parameter nil 'alpha (cond ((> num 100) 100)
                                        ((< num 0) 0)
                                        (t num))))

;; Keybindings
(siren-general-define-key
 "C-M-|" 'siren-transparency
 "C-M-<" 'siren-transparency-decrease
 "C-M->" 'siren-transparency-increase)

(provide 'siren-transparency)
;;; siren-transparency.el ends here
