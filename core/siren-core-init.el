;;; siren-core-init.el --- jimeh's Emacs Siren: Initialize all the things

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
(when (version< emacs-version "26.1")
  (error "Siren requires at least GNU Emacs 26.1, but you're running %s"
         emacs-version))

;; Setup basic paths.
(setq siren-core-dir (file-name-directory load-file-name))
(setq siren-dir (expand-file-name ".." siren-core-dir))
(add-to-list 'load-path siren-core-dir)

;; Configure siren-cache-dir
(setq siren-cache-dir (expand-file-name "cache" user-emacs-directory))
(unless (file-exists-p siren-cache-dir)
  (make-directory siren-cache-dir))

;; Core stuff
(require 'siren-core-custom)
(require 'siren-core-utils)

;; Continue core stuff
(require 'siren-core-packages)
(require 'siren-core-performance)
(require 'siren-core-env)
(require 'siren-core-ui)
(require 'siren-core-editor)

;; macOS specific
(when (eq system-type 'darwin)
  (require 'siren-core-macos))

;; Linux specific
(when (eq system-type 'gnu/linux)
  (require 'siren-core-linux))

;; Config changes made through the customize UI will be store here
(setq custom-file (expand-file-name "custom.el" siren-dir))
(load-file custom-file)

;; The modules
(require 'siren-core-modules)

(provide 'siren-core-init)
;;; siren-core-init.el ends here
