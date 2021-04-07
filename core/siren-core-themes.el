;;; siren-core-themes.el --- jimeh's Emacs Siren: Custom themes.

;;; Commentary:

;; Enable loading custom themes.

;;; Code:

(defvar siren-themes-dir (expand-file-name "themes" siren-dir)
  "Root directory for Emacs Siren custom themes.")
(add-to-list 'custom-theme-load-path siren-themes-dir)

(provide 'siren-core-themes)
;;; siren-core-themes.el ends here
