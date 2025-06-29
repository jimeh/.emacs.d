;;; siren-insert.el --- jimeh's Emacs Siren: misc text insert functions  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Misc text insert functions for characters or text which is normally not easy
;; to type in Emacs.

;;; Code:

(defun insert-en-dash ()
  "Insert an en dash (U+2013, –)."
  (interactive)
  (insert ?\u2013))

(defun insert-em-dash ()
  "Insert an em dash (U+2014, —)."
  (interactive)
  (insert ?\u2014))

(provide 'siren-insert)
;;; siren-insert.el ends here
