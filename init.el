;;
;; Emacs Configuration
;;

;; Set root directory of Emacs config
(setq emacs-config-dir
      (file-name-directory (or load-file-name (buffer-file-name))))

;; Determine if GUI or console settings should apply
(setq gui-window-system
      (if (or (getenv "EMACS_GUI_SERVER") window-system) t 'nil))

;; Helper function for config path
(defun get-config-path(path)
  "Appends argument at the end of emacs-config-dir using expand-file-name"
  (expand-file-name path emacs-config-dir))

;; Load various config files
(load-file (get-config-path "env.el"))
(load-file (get-config-path "packages.el"))
(load-file (get-config-path "helpers.el"))
(load-file (get-config-path "mode-customizations.el"))
(load-file (get-config-path "vendor.el"))
(load-file (get-config-path "behavior.el"))
(load-file (get-config-path "appearance.el"))
(load-file (get-config-path "keybindings.el"))
(load-file (get-config-path "aliases.el"))
(load-file (get-config-path "remember.el"))
(load-file (get-config-path "project-definitions.el"))

;; Custom variables file
(setq custom-file (get-config-path "custom-variables.el"))
(load-file custom-file)

;; Load runtime specific setup files
(load-file (get-config-path "runtimes/ruby.el"))
(load-file (get-config-path "runtimes/nodejs.el"))

;; Initialize packages in packages.el
(initialize-my-packages)
