;;; siren-init.el --- jimeh's Emacs Siren: Initialize all the things

;;; Commentary:

;; Initialize and start loading Emacs Siren config.

;;; Code:

;; Display the total loading time in the minibuffer

(defun display-startup-echo-area-message ()
  "Display startup echo area message."
  (message "Siren initialized in %s" (emacs-init-time)))

(message "Siren is powering up... Be patient, Master %s!"
         (getenv (if (equal system-type 'windows-nt) "USERNAME" "USER")))

;; Check Emacs version.
(when (version< emacs-version "24.1")
  (error "Siren requires at least GNU Emacs 24.1, but you're running %s"
         emacs-version))

;; Setup basic paths.
(setq siren-core-dir (file-name-directory load-file-name))
(setq siren-dir (expand-file-name ".." siren-core-dir))
(add-to-list 'load-path siren-core-dir)

;; Configure savefile-dir
(setq siren-savefile-dir (expand-file-name "savefile" siren-dir))
(unless (file-exists-p siren-savefile-dir)
  (make-directory siren-savefile-dir))

;; Ensure vendor directory load-paths are configured
(require 'siren-vendor)

;; Core stuff
(require 'siren-custom)
(require 'siren-core)
(require 'siren-packages)
(require 'siren-env)
(require 'siren-ui)
(require 'siren-editor)

;; OSX specific
(when (eq system-type 'darwin)
  (require 'siren-osx))

;; Linux specific
(when (eq system-type 'gnu/linux)
  (require 'siren-linux))

;; config changes made through the customize UI will be store here
(setq custom-file (expand-file-name "custom.el" siren-dir))
(load-file custom-file)

;; The modules
(require 'siren-modules)

;; The theme
(require 'siren-theme)

(provide 'siren-init)
;;; siren-init.el ends here
