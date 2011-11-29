;; emacs configuration

(load-file "~/.emacs.d/env.el")
(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/helpers.el")
(load-file "~/.emacs.d/languages.el")
(load-file "~/.emacs.d/vendor.el")
(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/keybindings.el")
(load-file "~/.emacs.d/remember.el")

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode 1)

;; (winner-mode 1)

;; (desktop-save-mode 1)

;; Custom variables file
(setq custom-file "~/.emacs.d/custom-variables.el")
(load-file custom-file)

;; Initialize packages in packages.el
(initialize-packages)
