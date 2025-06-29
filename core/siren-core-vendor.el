;;; siren-core-vendor.el --- jimeh's Emacs Siren: Module loading.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Load the vendor!

;;; Code:

(defvar siren-vendor-dir (siren-dir "vendor")
  "Root directory for Emacs Siren vendor.")
(siren-recursive-add-to-load-path siren-vendor-dir)

(provide 'siren-core-vendor)
;;; siren-core-vendor.el ends here
