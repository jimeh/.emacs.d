;;; siren-ecb.el --- jimeh's Emacs Siren: ECB configuration.

;;; Commentary:

;; Basic configuration for ECB.

;;; Code:

(siren-require-packages '(ecb))

(require 'ecb)

(setq ecb-layout-name "left13")
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(setq ecb-tree-make-parent-node-sticky nil)
(setq ecb-prescan-directories-for-emptyness nil)
(setq ecb-tip-of-the-day nil)
(setq ecb-tree-indent 3)
(setq ecb-windows-width 0.24)
(setq ecb-source-path
   (quote
    (("~/Projects" "Projects")
     ("/media/projects" "devbox/projects")
     ("~/.emacs.d" ".emacs.d")
     ("~/.dotfiles" ".dotfiles")
     ("~/Notes" "Notes")
     ("~/Projects/which" "which")
     ("~/Projects/fitzdares" "fitzdares")
     ("~/Projects/Go" "Go")
     ("~/src" "src")
     ("~/Sites" "Sites")
     ("~" "~")
     ("/" "/"))))

;; Add "^Icon$" as a exclude to the default sources. Dropbox uses "Icon" files
;; with some weird unprintable character at the end of the filename to customize
;; the folder icon. ECB however errors out when trying to render this file,
;; hence we're no longer displaying it at all.
(setq ecb-source-file-regexps
 (quote
  ((".*"
    ("\\(^\\(#\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\)$\\)\\)" "^Icon$")
    ("^\\.\\(emacs\\|gnus\\)$")))))

(if window-system (ecb-activate))

(provide 'siren-ecb)
;;; siren-ecb.el ends here
