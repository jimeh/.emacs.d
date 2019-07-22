;;; siren-packages.el --- jimeh's Emacs Siren: Core package setup

;;; Commentary:

;; Install and configure various packages that the core of Siren depends on.

;;; Code:

(require 'cl)
(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )

;; set package-user-dir to be relative to config path
(setq package-user-dir (expand-file-name "elpa" siren-dir))
(package-initialize)

(defvar siren-packages
  '(dash
    diminish
    exec-path-from-shell
    smart-mode-line
    use-package)
  "A list of default packages to ensure are installed at launch.")

;;
;; Package helpers (borrowed from Emacs Prelude)
;;

(defun siren-packages-installed-p ()
  "Check if all packages in `siren-packages' are installed."
  (every #'package-installed-p siren-packages))

(defun siren-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package siren-packages)
    (add-to-list 'siren-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun siren-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'siren-require-package packages))

(defun siren-install-packages ()
  "Install all packages listed in `siren-packages'."
  (unless (siren-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (siren-require-packages siren-packages)))

;; Install Melpa packages
(siren-install-packages)

;; Ensure use-package is loaded and configured
(require 'use-package)
(setq use-package-always-ensure t)

(provide 'siren-packages)
;;; siren-packages.el ends here
