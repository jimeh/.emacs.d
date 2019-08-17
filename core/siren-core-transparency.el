;;; siren-core-transparency.el --- jimeh's Emacs Siren: Emacs Frame transparency.

;;; Commentary:

;; Basic helpers and configuration for frame transparency.

;;; Code:

(defun siren-transparency-fix ()
  "Set initial value of alpha parameter for the current frame."
  (interactive)
  (if (equal (frame-parameter nil 'alpha) nil)
      (set-frame-parameter nil 'alpha 100)))

(defun siren-transparency-increase ()
  "Increase level of transparency for the current frame."
  (interactive)
  (siren-transparency-fix)
  (if (> (frame-parameter nil 'alpha) 0)
      (let ((new-level (+ (frame-parameter nil 'alpha) -1)))
        (set-frame-parameter nil 'alpha new-level)
        (message "Frame transparency set to %s" new-level))
    (message "This is a minimum value of transparency!")))

(defun siren-transparency-decrease ()
  "Decrease level of transparency for the current frame."
  (interactive)
  (siren-transparency-fix)
  (if (< (frame-parameter nil 'alpha) 100)
      (let ((new-level (+ (frame-parameter nil 'alpha) +1)))
        (set-frame-parameter nil 'alpha (+ (frame-parameter nil 'alpha) +1))
        (message "Frame transparency set to %s" new-level))
    (message "This is a minimum value of transparency!")))

(defun siren-transparency (numb)
  "Set level of transparency for the current frame by providing NUMB."
  (interactive "nEnter transparency level in range 0-100: ")
  (if (> numb 100)
      (message "Error! The maximum value for transparency is 100!")
    (if (< numb 0)
        (message "Error! The minimum value for transparency is 0!")
      (set-frame-parameter nil 'alpha numb))))

(siren-transparency siren-transparency-level)
(add-hook 'after-make-frame-functions
          (lambda (selected-frame)
            (set-frame-parameter selected-frame 'alpha siren-transparency-level)))

;; Keybindings
(global-set-key (kbd "C-M-|") 'siren-transparency)
(global-set-key (kbd "C-M-<") 'siren-transparency-increase)
(global-set-key (kbd "C-M->") 'siren-transparency-decrease)

(provide 'siren-core-transparency)
;;; siren-core-transparency.el ends here
