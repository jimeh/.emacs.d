;;; siren-zone.el --- jimeh's Emacs Siren: zone configuration.

;;; Commentary:

;; Basic configuration for zone.

;;; Code:

(require 'zone)
(zone-when-idle 120)

(defun zone-choose (pgm)
  "Choose a PGM to run for `zone'."
  (interactive
   (list
    (completing-read
     "Program: "
     (mapcar 'symbol-name zone-programs))))
  (let ((zone-programs (list (intern pgm))))
    (zone)))

(provide 'siren-zone)
;;; siren-zone.el ends here
