;;; siren-core-themes.el --- jimeh's Emacs Siren: Custom themes.

;;; Commentary:

;; Enable loading custom themes.

;;; Code:

(defvar siren-themes-dir (expand-file-name "themes" siren-dir)
  "Root directory for Emacs Siren custom themes.")
(add-to-list 'custom-theme-load-path siren-themes-dir)

;; Globally disable setting face weight to bold.
(defvar siren-set-face-ignore-attributes '(:weight))
(defadvice set-face-attribute
    (before ignore-attributes (face frame &rest args) activate)
  (setq args
        (apply 'nconc
               (mapcar (lambda (i)
                         (let ((attribute (nth i args))
                               (value (nth (1+ i) args)))
                           (if (not (memq attribute
                                          siren-set-face-ignore-attributes))
                               (list attribute value))))
                       (number-sequence 0 (1- (length args)) 2)))))

(provide 'siren-core-themes)
;;; siren-core-themes.el ends here
