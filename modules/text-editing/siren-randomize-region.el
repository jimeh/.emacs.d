;;; siren-randomize-region.el --- jimeh's Emacs Siren: randomize-region  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Helper command to randomize the order of lines in region. Shamelessly ripped
;; from: https://www.emacswiki.org/emacs/RandomizeBuffer

;;; Code:

(defun randomize-region (beg end)
  "Randomize lines in region from BEG to END."
  (interactive "*r")
  (let ((lines (split-string
                (delete-and-extract-region beg end) "\n")))
    (when (string-equal "" (car (last lines 1)))
      (setq lines (butlast lines 1)))
    (apply 'insert
           (mapcar 'cdr
                   (sort (mapcar
                          (lambda (x) (cons (random) (concat x "\n"))) lines)
                         (lambda (a b) (< (car a) (car b))))))))

(provide 'siren-randomize-region)
;;; siren-randomize-region.el ends here
