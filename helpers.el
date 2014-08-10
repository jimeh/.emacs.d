;;
;; Auto-indent on Paste
;;

(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))


;;
;; Insert Hash
;;

(defun insert-hash()
  "Inserts a hash into the buffer. Useful for UK keyboard layout users."
  (interactive)
  (insert "#"))

;;
;; Duplicate Line
;; - from: http://tuxicity.se/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
;;

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))


;;
;; Align Equal Signs
;;

(defun align-region-to-equals (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

(defun align-region-to-opening-brace (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\){" 1 1 ))


;;
;; Yank Pop Forwards
;;

(defun yank-pop-forwards (arg)
  (interactive "p")
  (yank-pop (- arg)))


;;
;; Window Switching
;;

(defun other-window-reverse ()
  "Switch to the previous window"
  (interactive)
  (other-window -1))


;;
;; Window Re-sizing
;;

(defun enlarge-window-down  () (interactive) (enlarge-window 1))
(defun enlarge-window-up    () (interactive) (enlarge-window -1))
(defun enlarge-window-left  () (interactive) (enlarge-window -1 t))
(defun enlarge-window-right () (interactive) (enlarge-window 1 t))


;;
;; Window Swapping
;; - from https://gist.github.com/287633
;;

(defun swap-with (dir)
  (interactive)
  (let ((other-window (windmove-find-other-window dir)))
    (when other-window
      (let* ((this-window  (selected-window))
             (this-buffer  (window-buffer this-window))
             (other-buffer (window-buffer other-window))
             (this-start   (window-start this-window))
             (other-start  (window-start other-window)))
        (set-window-buffer this-window  other-buffer)
        (set-window-buffer other-window this-buffer)
        (set-window-start  this-window  other-start)
        (set-window-start  other-window this-start)))))

(defun swap-with-down  () (interactive) (swap-with 'down))
(defun swap-with-up    () (interactive) (swap-with 'up))
(defun swap-with-left  () (interactive) (swap-with 'left))
(defun swap-with-right () (interactive) (swap-with 'right))

;;
;; Transparency
;;

(defun transparency-set-initial-value ()
  "Set initial value of alpha parameter for the current frame"
  (interactive)
  (if (equal (frame-parameter nil 'alpha) nil)
      (set-frame-parameter nil 'alpha 100)))

(defun transparency-set-value (numb)
  "Set level of transparency for the current frame"
  (interactive "nEnter transparency level in range 0-100: ")
  (if (> numb 100)
      (message "Error! The maximum value for transparency is 100!")
    (if (< numb 0)
        (message "Error! The minimum value for transparency is 0!")
      (set-frame-parameter nil 'alpha numb))))

(defun transparency-increase ()
  "Increase level of transparency for the current frame"
  (interactive)
  (transparency-set-initial-value)
  (if (> (frame-parameter nil 'alpha) 0)
      (set-frame-parameter nil 'alpha (+ (frame-parameter nil 'alpha) -1))
    (message "This is a minimum value of transparency!")))

(defun transparency-decrease ()
  "Decrease level of transparency for the current frame"
  (interactive)
  (transparency-set-initial-value)
  (if (< (frame-parameter nil 'alpha) 100)
      (set-frame-parameter nil 'alpha (+ (frame-parameter nil 'alpha) +1))
    (message "This is a minimum value of transparency!")))


;;
;; Escreen Helper
;; - from http://blog.nguyenvq.com/2011/03/07/escreen-instead-of-elscreen-for-screen-like-features-in-emacs/
;;

(defun escreen-get-active-screen-numbers-with-emphasis ()
  "what the name says"
  (interactive)
  (let ((escreens (escreen-get-active-screen-numbers))
        (emphased ""))
    (dolist (s escreens)
      (setq emphased
            (concat emphased (if (= escreen-current-screen-number s)
                                 (propertize (number-to-string s)
                                             ;;'face 'custom-variable-tag) " ")
                                             ;;'face 'info-title-3)
                                             'face 'font-lock-warning-face)
                               ;;'face 'secondary-selection)
                               (number-to-string s))
                    " ")))
    (message "escreen: active screens: %s" emphased)))


;;
;; File and Buffer Renaming
;; - from: http://emacsredux.com/blog/2013/05/04/rename-file-and-buffer/
;;

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)))))))


;;
;; HideShow mode helpers
;; - from: http://www.emacswiki.org/emacs/HideShow
;;
(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
         (1+ (current-column))))))

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (toggle-selective-display column)))
