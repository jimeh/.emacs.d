;;; siren-core-packages.el --- jimeh's Emacs Siren: Core package setup

;;; Commentary:

;; Install and configure various packages that the core of Siren depends on.

;;; Code:

;; TODO: Look into a better solution for this workaround.
;;
;; Hacky workaround for recursive load error caused by jka-compr when
;; load-prefer-newer is enabled.
(setq load-prefer-newer nil)
(require 'jka-compr)
(setq load-prefer-newer t)

;; Initialize straight.el
(setq straight-cache-autoloads t
      straight-check-for-modifications '(check-on-save find-when-checking)
      straight-profiles '((nil . "default.el")
                          (pinned . "pinned.el"))
      straight-repository-branch "develop"
      straight-use-package-by-default t
      straight-use-version-specific-build-dir t
      use-package-always-ensure nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(autoload 'straight-x-clean-unused-repos "straight-x" nil t)
(autoload 'straight-x-pull-all "straight-x" nil t)
(autoload 'straight-x-freeze-versions "straight-x" nil t)
(autoload 'straight-x-thaw-pinned-versions "straight-x" nil t)

(defun straight-x-pin-package (package gitsha)
  (add-to-list 'straight-x-pinned-packages
               `(,package . ,gitsha)))

;; Make use-package available.
(straight-use-package 'use-package)

;; Make general.el keybinding helpers available.
(use-package general)

(provide 'siren-core-packages)
;;; siren-core-packages.el ends here
