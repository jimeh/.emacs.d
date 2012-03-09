;;
;; Emacs Configuration
;;

;; Set root directory of Emacs config
(setq emacs-config-dir
      (file-name-directory (or load-file-name (buffer-file-name))))

;; Helper function for config path
(defun config-path(path)
  "Appends argument at the end of emacs-config-dir using expand-file-name"
  (expand-file-name path emacs-config-dir))

;; Load various config files
(load-file (config-path "env.el"))
(load-file (config-path "packages.el"))
(load-file (config-path "helpers.el"))
(load-file (config-path "mode-customizations.el"))
(load-file (config-path "vendor.el"))
(load-file (config-path "behavior.el"))
(load-file (config-path "appearance.el"))
(load-file (config-path "keybindings.el"))
(load-file (config-path "remember.el"))
(load-file (config-path "project-definitions.el"))

;; Custom variables file
(setq custom-file (config-path "custom-variables.el"))
(load-file custom-file)

;; Initialize packages in packages.el
(initialize-packages)
