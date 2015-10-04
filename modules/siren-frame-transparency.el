;;
;; frame transparency
;;

(defun siren-frame-transparency-fix ()
  "Set initial value of alpha parameter for the current frame"
  (interactive)
  (if (equal (frame-parameter nil 'alpha) nil)
      (set-frame-parameter nil 'alpha 100)))

(defun siren-frame-transparency-increase ()
  "Increase level of transparency for the current frame"
  (interactive)
  (siren-frame-transparency-fix)
  (if (> (frame-parameter nil 'alpha) 0)
      (set-frame-parameter nil 'alpha (+ (frame-parameter nil 'alpha) -1))
    (message "This is a minimum value of transparency!")))

(defun siren-frame-transparency-decrease ()
  "Decrease level of transparency for the current frame"
  (interactive)
  (siren-frame-transparency-fix)
  (if (< (frame-parameter nil 'alpha) 100)
      (set-frame-parameter nil 'alpha (+ (frame-parameter nil 'alpha) +1))
    (message "This is a minimum value of transparency!")))

(defun siren-frame-transparency (numb)
  "Set level of transparency for the current frame"
  (interactive "nEnter transparency level in range 0-100: ")
  (if (> numb 100)
      (message "Error! The maximum value for transparency is 100!")
    (if (< numb 0)
        (message "Error! The minimum value for transparency is 0!")
      (set-frame-parameter nil 'alpha numb))))

(setq siren-transparency-level 99)
(siren-frame-transparency siren-transparency-level)
(add-hook 'after-make-frame-functions
          (lambda (selected-frame)
            (set-frame-parameter selected-frame 'alpha siren-transparency-level)))

;; Keybindings
(global-set-key (kbd "C-M-|") 'siren-frame-transparency)
(global-set-key (kbd "C-M-<") 'siren-frame-transparency-increase)
(global-set-key (kbd "C-M->") 'siren-frame-transparency-decrease)


(provide 'siren-frame-transparency)
