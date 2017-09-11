;;; siren-vendor.el --- jimeh's Emacs Siren: Setup vendor load-paths

;;; Commentary:

;; Setup vendor directory load paths.

;;; Code:

(defun siren-add-subfolders-to-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (string-prefix-p "." f)))
        (add-to-list 'load-path name)
        (siren-add-subfolders-to-load-path name)))))

(setq siren-vendor-dir (expand-file-name "vendor" siren-dir))

(add-to-list 'load-path siren-vendor-dir)
(siren-add-subfolders-to-load-path siren-vendor-dir)

(provide 'siren-vendor)
;;; siren-vendor.el ends here
