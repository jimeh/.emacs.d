;;; siren-core-vendor.el --- jimeh's Emacs Siren: Setup vendor load-paths

;;; Commentary:

;; Setup vendor directory load paths.

;;; Code:

(setq siren-vendor-dir (expand-file-name "vendor" siren-dir))
(siren-recursive-add-to-load-path siren-vendor-dir)

(provide 'siren-core-vendor)
;;; siren-core-vendor.el ends here
