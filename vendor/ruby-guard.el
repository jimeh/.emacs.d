;;; ruby-guard.el --- Launching guard directly inside emacs.

;; Copyright (C) 2014 Zhang Kai Yu

;; Author: Zhang Kai Yu <yeannylam@gmail.com>
;; Version: 0.1.0
;; Keywords: ruby, guard, rails
;; URL: https://github.com/cheunghy/ruby-guard

;;; Commentary:

;; M-x ruby-guard to launch.

;;; Code:

(defvar ruby-guard-buffer-name "*guard*")

(defun ruby-guard-root (&optional last-directory)
  "Return the directory name where guard file is located."
  (locate-dominating-file (or last-directory
                              (file-truename default-directory))
                          "Guardfile"))

(defun ruby-guard-spring-p ()
  "Return non-nil if spring tmpdir found for `ruby-guard-root'."
  (file-exists-p (file-truename
                  (concat temporary-file-directory
                          "spring/"
                          (md5 (ruby-guard-root) 0 -1)
                          ".pid"))))

(defun ruby-guard-zeus-p ()
  "Return non-nil if `.zeus.sock' found in `ruby-guard-root'."
  (file-exists-p (expand-file-name ".zeus.sock" (ruby-guard-root))))

(defun ruby-guard-chef-cookbook-p ()
  "Return non-nil if `ruby-guard-root' is in Chef cookbook."
  (file-exists-p (expand-file-name "recipes" (ruby-guard-root))))

(defun ruby-guard-chefdk-installed-p ()
  "Return non-nil if Chef development kit directory is present."
  (file-exists-p "/opt/chefdk"))

(defun ruby-guard-bundle-p ()
  "Return non-nil if `Gemfile' found in `ruby-guard-root'."
  (file-exists-p (expand-file-name "Gemfile" (ruby-guard-root))))

(defun ruby-guard-command-name ()
  "Return ruby-guard-command."
  (cond ((ruby-guard-spring-p)
         "spring guard")
        ((ruby-guard-bundle-p)
         "bundle exec guard")
        ((and (ruby-guard-chef-cookbook-p)
              (ruby-guard-chefdk-installed-p))
         "chef exec guard")
        (t "guard")))

(defmacro ruby-guard-with-root (body-form)
  "Run (BODY-FORM) with `ruby-guard-root' as `default-directory'."
  `(let ((default-directory (ruby-guard-root)))
     ,body-form))

;;;###autoload
(defun ruby-guard ()
  "Run Guard in separate buffer."
  (interactive)
  (let ((default-directory (ruby-guard-root)))
    (if default-directory
        (progn
          (if (member ruby-guard-buffer-name
                      (mapcar 'buffer-name (buffer-list)))
              (switch-to-buffer ruby-guard-buffer-name)
            (ruby-guard-with-root
             (async-shell-command
              (ruby-guard-command-name)
              (get-buffer-create ruby-guard-buffer-name)))))
      (error "Cannot find Guardfile."))))

(provide 'ruby-guard)

;;; ruby-guard.el ends here
