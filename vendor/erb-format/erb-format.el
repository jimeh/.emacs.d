;;; erb-format.el --- Format files with erb-format.

;; Copyright (C) 2024 Jim Myhrberg

;; Author: Jim Myhrberg <contact@jimeh.me>
;; Keywords: formatting, tools
;; Package-Requires: ((emacs "25.1") (reformatter "0.6"))
;; Package-Version: 0.0.1

;;; Commentary:

;; This package provides a simple way to format ERB files using erb_lint.

;;; Code:

(require 'reformatter)

(defgroup erb-format nil
  "Format buffers with erb-format."
  :group 'tools)

(defcustom erb-format-executable "erb_lint"
  "Name/path of the erb-format executable."
  :group 'erb-format
  :type 'string)

(defcustom erb-format-config-filename ".erb-lint.yml"
  "Name/path of the erb-format executable."
  :group 'erb-format
  :type 'string)

(defcustom erb-format-extra-args nil
  "Extra arguments to pass to erblint."
  :group 'erb-format
  :type '(repeat string))
(make-variable-buffer-local 'erb-format-extra-args)


(defun erb-format--config-file-dir ()
  "Return the directory where the .erb-lint.yml config file is found, or nil."
  (when buffer-file-name
    (locate-dominating-file buffer-file-name erb-format-config-filename)))

(defun erb-format--config-file ()
  "Return the path of the .erb-lint.yml config file, or nil."
  (when buffer-file-name
    (let ((dir (erb-format--config-file-dir)))
      (if dir
          (expand-file-name erb-format-config-filename dir)))))

;;;###autoload (autoload 'erb-format-buffer "erb-format" nil t)
;;;###autoload (autoload 'erb-format-region "erb-format" nil t)
;;;###autoload (autoload 'erb-format-on-save-mode "erb-format" nil t)
(reformatter-define erb-format
  :program erb-format-executable
  :args (let ((config-file (erb-format--config-file)))
          (append
           (when config-file `("--config" ,config-file))
           `("--autocorrect" ,input-file)
           erb-format-extra-args))
  :stdin nil
  :lighter " fmt"
  :group 'erb-format
  :working-directory (erb-format--config-file-dir)) ; Use the directory where config is found.

(provide 'erb-format)

;;; erb-format.el ends here
