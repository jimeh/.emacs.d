;;; siren-core-packages.el --- jimeh's Emacs Siren: Core package setup

;;; Commentary:

;; Install and configure various packages that the core of Siren depends on.

;;; Code:

;; Initialize straight.el
(setq straight-cache-autoloads t
      straight-check-for-modifications '(check-on-save find-when-checking)
      straight-repository-branch "develop"
      straight-use-package-by-default t
      use-package-always-ensure nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(autoload 'straight-x-clean-unused-repos "straight-x" nil t)

(straight-use-package 'use-package)

(provide 'siren-core-packages)
;;; siren-core-packages.el ends here
