;;; siren-core-vendor.el --- jimeh's Emacs Siren: Setup vendor load-paths

;;; Commentary:

;; Setup vendor directory load paths.

;;; Code:

(setq siren-vendor-dir (expand-file-name "vendor" siren-dir))

(add-to-list 'load-path siren-vendor-dir)
(siren-add-subfolders-to-load-path siren-vendor-dir)

(provide 'siren-core-vendor)
;;; siren-core-vendor.el ends here
