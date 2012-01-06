;; emacs configuration

(load-file "~/.emacs.d/env.el")
(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/helpers.el")
(load-file "~/.emacs.d/languages.el")
(load-file "~/.emacs.d/vendor.el")
(load-file "~/.emacs.d/behavior.el")
(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/keybindings.el")
(load-file "~/.emacs.d/remember.el")
(load-file "~/.emacs.d/project-definitions.el")

;; Custom variables file
(setq custom-file "~/.emacs.d/custom-variables.el")
(load-file custom-file)

;; Initialize packages in packages.el
(initialize-packages)
