;;; early-init.el --- jimeh's Emacs Siren: early init file.

;;; Commentary:

;; The file before the file that starts it all.

;;; Code:

;; Disable Emacs 27's automatic package.el initialization before the init.el
;; file is loaded. I use straight.el instead of package.el.
(setq package-enable-at-startup nil)

;;; early-init.el ends here
