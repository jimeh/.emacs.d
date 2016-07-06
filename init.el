;;; init.el --- jimeh's Emacs Siren: init file.

;;; Commentary:

;; The file that starts it all.

;;; Code:

;; I need to keep this here commented out like this to prevent package.el from
;; automatically adding it again. I call `(package-initalize)' manually from
;; the `core/siren-packages.el' file that's loaded in further down.
;;
;; (package-initialize)

(defvar current-user
      (getenv (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Siren is powering up... Be patient, Master %s!" current-user)

(when (version< emacs-version "24.1")
  (error "Siren requires at least GNU Emacs 24.1, but you're running %s"
         emacs-version))

;; Always load newest byte code
(setq load-prefer-newer t)

;; Setup paths
(defvar siren-dir (file-name-directory load-file-name)
  "The root dir of the Emacs config.")
(defvar siren-core-dir (expand-file-name "core" siren-dir)
  "The home of core stuff.")
(defvar siren-modules-dir (expand-file-name "modules" siren-dir)
  "This directory houses all of the modules.")
(defvar siren-themes-dir (expand-file-name "themes" siren-dir)
  "This directory houses all of the modules.")
(defvar siren-savefile-dir (expand-file-name "savefile" siren-dir)
  "This folder stores all the automatically generated save/history-files.")
(defvar siren-vendor-dir (expand-file-name "vendor" siren-dir)
  "This directory houses packages that are not yet available in ELPA (or MELPA).")

(defvar siren-modules-file (expand-file-name "siren-modules.el" siren-dir)
  "This files contains a list of modules to be loaded.")
(defvar siren-theme-file (expand-file-name "siren-theme.el" siren-dir)
  "This files contains a list of modules to be loaded.")

(unless (file-exists-p siren-savefile-dir)
  (make-directory siren-savefile-dir))

(defun siren-add-subfolders-to-load-path (parent-dir)
 "Add all level PARENT-DIR subdirs to the `load-path'."
 (dolist (f (directory-files parent-dir))
   (let ((name (expand-file-name f parent-dir)))
     (when (and (file-directory-p name)
                (not (string-prefix-p "." f)))
       (add-to-list 'load-path name)
       (siren-add-subfolders-to-load-path name)))))

(add-to-list 'load-path siren-core-dir)
(add-to-list 'load-path siren-modules-dir)
(add-to-list 'load-path siren-themes-dir)
(add-to-list 'load-path siren-vendor-dir)
(siren-add-subfolders-to-load-path siren-vendor-dir)

;; core stuff
(require 'siren-custom)
(require 'siren-core)
(require 'siren-packages)
(require 'siren-env)
(require 'siren-ui)
(require 'siren-editor)

;; osx specific
(when (eq system-type 'darwin)
  (require 'siren-osx))

;; config changes made through the customize UI will be store here
(setq custom-file (expand-file-name "custom.el" siren-dir))
(load-file custom-file)

;; the modules
(if (file-exists-p siren-modules-file)
    (load siren-modules-file))

;; the theme
(if (file-exists-p siren-theme-file)
  (load siren-theme-file))

;;; init.el ends here
