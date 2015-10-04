;;
;; packages
;;

(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; set package-user-dir to be relative to config path
(setq package-user-dir (expand-file-name "elpa" siren-dir))
(package-initialize)

(defvar siren-packages
  '(browse-kill-ring
    dash
    discover-my-major
    diff-hl
    diminish
    easy-kill
    epl
    gist
    git-timemachine
    gitconfig-mode
    gitignore-mode
    ; god-mode
    grizzl
    ; operate-on-number
    smart-mode-line
    ; smartrep
    undo-tree
    )
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


(provide 'siren-packages)
