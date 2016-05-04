;;; siren-folding.el --- jimeh's Emacs Siren: folding configuration.

;;; Commentary:

;; Basic configuration for folding code.

;;; Code:

(siren-require-packages '(hideshowvis))

(require 'hideshowvis)

(defun siren-toggle-hiding (column)
  "Toggle hiding/showing blocks via hs-mode.

Borrowed from: http://www.emacswiki.org/emacs/HideShow"
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (siren-toggle-selective-display column)))

(defun siren-toggle-selective-display (column)
  "Helper function for `siren-toggle-hiding'."
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
         (1+ (current-column))))))

;; Keybindings
(global-set-key (kbd "C-=") 'siren-toggle-selective-display)
(global-set-key (kbd "C-c C-h") 'siren-toggle-hiding)

(provide 'siren-folding)
;;; siren-folding.el ends here
