;;; siren-core-theme.el --- jimeh's Emacs Siren: Theme loading.

;;; Commentary:

;; Load the theme!

;;; Code:

(setq siren-themes-dir (expand-file-name "themes" siren-dir))
(siren-recursive-add-to-load-path siren-themes-dir)

(if window-system
    (require 'siren-theme-doom-vibrant)
  (require 'siren-theme-tomorrow-night-paradise))

(provide 'siren-core-theme)
;;; siren-core-theme.el ends here
