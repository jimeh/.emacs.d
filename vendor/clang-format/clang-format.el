;;; clang-format.el --- Format files with clang-format.

;; Copyright (C) 2022 Jim Myhrberg

;; Author: Jim Myhrberg <contact@jimeh.me>
;; Keywords: formatting, tools
;; Package-Requires: ((emacs "25.1") (reformatter "0.6"))
;; Package-Version: 0.0.1

(require 'reformatter)

(reformatter-define clang-format
  :program "clang-format"
  :args '("-style=file" "--assume-filename=%s")
  :lighter " TF")

(require 'reformatter)

(defgroup clang-format nil
  "Format buffers with clang-format."
  :group 'tools)

(defcustom clang-format-executable "clang-format"
  "Name/path of the clang-format executable."
  :group 'clang-format
  :type 'string)

(defcustom clang-format-style nil
  "Style argument to pass to clang-format.
By default clang-format will load the style configuration from
a file named .clang-format located in one of the parent directories
of the buffer."
  :group 'clang-format
  :type '(choice (string) (const nil))
  :safe #'stringp)
(make-variable-buffer-local 'clang-format-style)

(defcustom clang-format-fallback-style "none"
  "Fallback style to pass to clang-format.
This style will be used if clang-format-style is set to \"file\"
and no .clang-format is found in the directory of the buffer or
one of parent directories. Set to \"none\" to disable formatting
in such buffers."
  :group 'clang-format
  :type 'string
  :safe #'stringp)
(make-variable-buffer-local 'clang-format-fallback-style)

(defcustom clang-format-sort-includes t
  "Override the include sorting behavior.
As determined by the SortIncludes style flag."
  :group 'clang-format
  :type 'boolean)
(make-variable-buffer-local 'clang-format-sort-includes)

(defcustom clang-format-extra-args nil
  "Extra arguments to pass to clang-format."
  :group 'clang-format
  :type '(repeat string))
(make-variable-buffer-local 'clang-format-extra-args)

(defun clang-format--make-args ()
  "Helper to build the argument list for jq."
  (let* ((region-active (use-region-p))
         (start (bufferpos-to-filepos (region-beginning)))
         (end (bufferpos-to-filepos (region-end)))
         (length (abs (- end start))))
    (append
     (when buffer-file-name `("--assume-filename" ,buffer-file-name))
     (when clang-format-sort-includes '("--sort-includes"))
     (when region-active `("--offset" ,(number-to-string start)
                           "--length" ,(number-to-string length)))
     clang-format-extra-args)))

;;;###autoload (autoload 'clang-format-buffer "clang-format" nil t)
;;;###autoload (autoload 'clang-format-region "clang-format" nil t)
;;;###autoload (autoload 'clang-format-on-save-mode "clang-format" nil t)
(reformatter-define clang-format
  :program clang-format-executable
  :args (clang-format--make-args)
  :lighter "CLFmt"
  :group 'clang-format)

(provide 'clang-format)
