;;; siren-zone.el --- jimeh's Emacs Siren: zone configuration.

;;; Commentary:

;; Basic configuration for zone.

;;; Code:

(use-package zone
  :straight (:type built-in)
  :defer t

  :init
  (defun zone-choose (pgm)
    "Choose a PGM to run for `zone'."
    (interactive
     (list
      (completing-read
       "Program: "
       (mapcar 'symbol-name zone-programs))))
    (let ((zone-programs (list (intern pgm))))
      (zone))))

(use-package zone-nyan
  :defer t)

(provide 'siren-zone)
;;; siren-zone.el ends here
