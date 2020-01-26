;;; siren-folding.el --- jimeh's Emacs Siren: folding configuration.

;;; Commentary:

;; Basic configuration for folding code.

;;; Code:

(use-package hideshow
  :ensure nil ;; loaded from emacs built-ins
  :demand

  :bind
  ("C-=" . siren-folding-toggle-selective-display)
  ("C-c C-h" . siren-folding-toggle)

  :init
  (defun siren-folding (&optional arg)
    "Activate or deactivate code folding.
Optional ARG is passed directly to mode toggle function."
    (hs-minor-mode (or arg t))
    (hideshowvis-minor-mode (or arg t)))


  (defun siren-folding-toggle (column)
    "Toggle hiding/showing blocks via hs-mode.

Borrowed from: http://www.emacswiki.org/emacs/HideShow"
    (interactive "P")
    (if hs-minor-mode
        (if (condition-case nil
                (hs-toggle-hiding)
              (error t))
            (hs-show-all))
      (siren-folding-toggle-selective-display column)))

  (defun siren-folding-toggle-selective-display (column)
    "Helper function for `siren-folding-toggle'."
    (interactive "P")
    (set-selective-display
     (or column
         (unless selective-display
           (1+ (current-column)))))))

(use-package hideshowvis
  :ensure nil ;; loaded from vendor
  :demand)

(provide 'siren-folding)
;;; siren-folding.el ends here
