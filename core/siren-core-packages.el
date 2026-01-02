;;; siren-core-packages.el --- jimeh's Emacs Siren: Core package setup  -*- lexical-binding: nil; -*-

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

;; Always ensure packages are installed.
(setq use-package-always-ensure t)
(setq elpaca-lock-file (expand-file-name "elpaca/packages.lock.el" user-emacs-directory))

;;
;; Install Elpaca package manager.
;;

(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Enable Elpaca support for use-package's :ensure keyword.
(elpaca elpaca-use-package
  (elpaca-use-package-mode))

;;
;; Lock file and force update helpers.
;;

;; Freeze package versions into the lock file.
(defun elpaca-lock-versions ()
  "Write current package versions to `elpaca-lock-file'."
  (interactive)
  (if (or (null elpaca-lock-file) (string-empty-p elpaca-lock-file))
      (warn "elpaca-lock-file is not set")
    (elpaca-write-lock-file elpaca-lock-file)))

(defvar elpaca-force-update--packages nil
  "List of package IDs to force update, bypassing pin checks.")

(defun elpaca-force-update--pinned-p-advice (orig-fn e)
  "Advice to bypass pin check for packages in `elpaca-force-update--packages'."
  (if (and elpaca-force-update--packages
           (memq (elpaca<-id e) elpaca-force-update--packages))
      nil
    (funcall orig-fn e)))

(defun elpaca-force-update--clear-packages ()
  "Clear the force update package list after queue processing."
  (setq elpaca-force-update--packages nil))

;; Install advice and hook once at load time
(advice-add 'elpaca-pinned-p :around #'elpaca-force-update--pinned-p-advice)
(add-hook 'elpaca-post-queue-hook #'elpaca-force-update--clear-packages)

(defun elpaca-force-update (id)
  "Force update package ID, bypassing lock file pin."
  (interactive (list (elpaca--read-queued "Force update package: ")))
  (setq elpaca-force-update--packages (list id))
  (elpaca-update id t))

(defun elpaca-force-update-all ()
  "Force update all packages, bypassing lock file pins."
  (interactive)
  (setq elpaca-force-update--packages (mapcar #'car (elpaca--queued)))
  (elpaca-update-all t))

(provide 'siren-core-packages)
;;; siren-core-packages.el ends here
