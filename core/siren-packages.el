;;; siren-packages.el --- jimeh's Emacs Siren: Core package setup

;;; Commentary:

;; Install and configure various packages that the core of Siren depends on.

;;; Code:

(require 'cl)
(require 'package)

;; Work-around bug in Emacs 26.2 preventing GNU ELPA to work over HTTPS.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("gnu"          . 10)
        ("melpa-stable" . 5)
        ("melpa"        . 0)))

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
