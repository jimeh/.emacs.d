;;; siren-ecb.el --- jimeh's Emacs Siren: ECB configuration.

;;; Commentary:

;; Basic configuration for ECB.

;;; Code:

(use-package ecb
  :config
  (setq ecb-layout-name "left13"
        ecb-primary-secondary-mouse-buttons 'mouse-1--mouse-2
        ecb-tree-make-parent-node-sticky nil
        ecb-prescan-directories-for-emptyness nil
        ecb-tip-of-the-day nil
        ecb-tree-indent 3
        ecb-windows-width 0.24
        ecb-source-path '(("~/Projects" "Projects")
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
                          ("/" "/"))

        ;; Add "^Icon$" as a exclude to the default sources. Dropbox uses "Icon"
        ;; files with some weird unprintable character at the end of the
        ;; filename to customize the folder icon. ECB however errors out when
        ;; trying to render this file, hence we're no longer displaying it at
        ;; all.
        ecb-source-file-regexps
        (quote
         ((".*"
           ("\\(^\\(#\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\)$\\)\\)" "^Icon$")
           ("^\\.\\(emacs\\|gnus\\)$")))))

  (if window-system (ecb-activate))
  (global-set-key (kbd "C-x C-p") 'ecb-toggle-ecb-windows))

(provide 'siren-ecb)
;;; siren-ecb.el ends here
