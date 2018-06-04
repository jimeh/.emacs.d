;;; siren-zone.el --- jimeh's Emacs Siren: zone configuration.

;;; Commentary:

;; Basic configuration for zone.

;;; Code:

(require 'siren-linum)

(use-package zone
  :ensure nil ;; loaded from emacs built-ins
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

(provide 'siren-zone)
;;; siren-zone.el ends here
