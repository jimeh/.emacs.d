;;; siren-theme.el --- jimeh's Emacs Siren: Theme loading.

;;; Commentary:

;; Load the theme!

;;; Code:

(setq siren-themes-dir (expand-file-name "themes" siren-dir))
(add-to-list 'load-path siren-themes-dir)

(if window-system
    (require 'siren-theme-doom-vibrant)
  (require 'siren-theme-doom-one))

(provide 'siren-theme)
;;; siren-theme.el ends here
