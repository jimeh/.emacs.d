;;; siren-list-available-fonts.el --- jimeh's Emacs Siren: list-available-fonts helper.

;;; Commentary:

;; Helper function to list available fonts in a temporary buffer.

;;; Code:

(defun list-available-fonts ()
  "Display a list of available fonts in a new buffer."
  (interactive)
  (let ((font-list (sort (font-family-list) 'string<))
        (buffer-name "*Available Fonts*"))
    (with-output-to-temp-buffer buffer-name
      (with-current-buffer buffer-name
        (dolist (font font-list)
          (insert font "\n"))
        (special-mode)))
    (pop-to-buffer buffer-name)))

(provide 'siren-list-available-fonts)
;;; siren-list-available-fonts.el ends here
