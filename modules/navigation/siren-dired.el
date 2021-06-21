;;; siren-dired.el --- jimeh's Emacs Siren: dired configuration.

;;; Commentary:

;; Basic configuration for dired.

;;; Code:

(use-package dired
  :straight (:type built-in)
  :defer t
  :hook
  (dired-mode . siren-dired-mode-setup)
  :bind (:map dired-mode-map
              ("M-?" . siren-dired-display-size))

  :init
  (defun siren-dired-mode-setup ()
    (hl-line-mode +1))

  (defun siren-dired-display-size (arg)
    "Display disk usage of marked items in Dired.

    When given a PREFIX, display raw size of items instead of disk usage."
    (interactive "P")
    (if arg
        (siren-dired-get-size nil)
      (siren-dired-get-disk-usage)))

  ;; Based on dired-get-size from:
  ;; https://www.emacswiki.org/emacs/DiredGetFileSize
  (defun siren-dired-get-disk-usage ()
    "Display total disk usage of marked items in Dired."
    (interactive)
    (let ((files (dired-get-marked-files)))
      (with-temp-buffer
        (apply 'call-process (executable-find "du") nil t nil "-sch" files)
        (message "Size of all marked files: %s"
                 (progn
                   (re-search-backward "^\s*?\\([0-9.,]+[A-Za-z]+\\).*total$")
                   (match-string 1))))))

  (defun siren-dired-get-size (arg)
    "Display the total size of marked files in Dired."
    (interactive "P")
    (let ((size (siren-file-sizes (dired-get-marked-files))))
      (message "Size of all marked files: %s"
               (if arg
                   (format "%.0f" size)
                 (file-size-human-readable size 'si)))))

  (defun siren-directory-size (dirname)
    "Return the size of DIRNAME in bytes."
    (siren-file-sizes (directory-files-recursively dirname "")))

  (defun siren-file-sizes (filename-list)
    "Return the sum of sizes of FILENAME-LIST in bytes."
    (apply '+
           (mapcar 'siren-file-size filename-list)))

  (defun siren-file-size (filename)
    "Return size of file FILENAME in bytes.
    The size is converted to float for consistency.
    This doesn't recurse directories."
    (float (if (file-directory-p filename)
               (siren-directory-size filename)
             (file-attribute-size ; might be int or float
              (file-attributes filename)))))

  :config
  (require 'dired+)
  (when (string-match-p "^gnu" (symbol-name system-type))
    (setq dired-use-ls-dired t
          dired-listing-switches "-aBhl"))

  (when (string= system-type "darwin")
    (let ((gls (executable-find "gls")))
      (when gls
        (setq dired-use-ls-dired t
              insert-directory-program gls
              dired-listing-switches "-aBhl")))))

(use-package dired-x
  :straight (:type built-in)
  :after dired)

(use-package dired+
  :defer t
  :bind (:map dired-mode-map
              ("c" . dired-create-directory)
              ("C-l" . diredp-up-directory-reuse-dir-buffer))

  :hook
  (dired-mode . siren-diredp-mode-setup)

  :init
  (defun siren-diredp-mode-setup ()
    (toggle-diredp-find-file-reuse-dir 1))

  :config
  (unbind-key "M-i" dired-mode-map)
  (unbind-key "M-l" dired-mode-map)

  ;; BEGINING OF WORKAROUND
  ;;
  ;; TODO: Remove this hacky workaround once Dired+ is updated for Emacs 28.x
  ;;
  ;; As of commit 194d54a929a83fede75d618b104acd1b544feb10 in Emacs' master
  ;; branch, Dired+'s replacements of dired-do-*-deletes functions breaks
  ;; file/folder deletion in Dired.
  ;;
  ;; Until a fix is available in Dired+, lets just restore the original fuctions
  ;; from Dired.
  ;;
  ;; Dired change: https://github.com/emacs-mirror/emacs/commit/194d54a929a83fede75d618b104acd1b544feb10
  (defun dired-do-delete (&optional arg)
    "Delete all marked (or next ARG) files.
`dired-recursive-deletes' controls whether deletion of
non-empty directories is allowed."
    ;; This is more consistent with the file marking feature than
    ;; dired-do-flagged-delete.
    (interactive "P")
    (let (markers)
      (dired-internal-do-deletions
       (nreverse
        ;; this may move point if ARG is an integer
        (dired-map-over-marks (cons (dired-get-filename)
                                    (let ((m (point-marker)))
                                      (push m markers)
                                      m))
                              arg))
       arg t)
      (dolist (m markers) (set-marker m nil))))

  (defun dired-do-flagged-delete (&optional nomessage)
    "In Dired, delete the files flagged for deletion.
If NOMESSAGE is non-nil, we don't display any message
if there are no flagged files.
`dired-recursive-deletes' controls whether deletion of
non-empty directories is allowed."
    (interactive)
    (let* ((dired-marker-char dired-del-marker)
	   (regexp (dired-marker-regexp))
	   case-fold-search markers)
      (if (save-excursion (goto-char (point-min))
			  (re-search-forward regexp nil t))
	  (dired-internal-do-deletions
           (nreverse
	    ;; this can't move point since ARG is nil
	    (dired-map-over-marks (cons (dired-get-filename)
                                        (let ((m (point-marker)))
                                          (push m markers)
                                          m))
                                  nil))
	   nil t)
        (dolist (m markers) (set-marker m nil))
        (or nomessage
	    (message "(No deletions requested)")))))

  (defun dired-buffers-for-dir (dir &optional file subdirs)
  "Return a list of buffers for DIR (top level or in-situ subdir).
If FILE is non-nil, include only those whose wildcard pattern (if any)
matches FILE.
If SUBDIRS is non-nil, also include the dired buffers of
directories below DIR.
The list is in reverse order of buffer creation, most recent last.
As a side effect, killed dired buffers for DIR are removed from
dired-buffers."
  (setq dir (file-name-as-directory dir))
  (let (result buf)
    (dolist (elt dired-buffers)
      (setq buf (cdr elt))
      (cond
       ((null (buffer-name buf))
	;; Buffer is killed - clean up:
	(setq dired-buffers (delq elt dired-buffers)))
       ((file-in-directory-p (car elt) dir)
	(with-current-buffer buf
          (when (and (or subdirs
                         (assoc dir dired-subdir-alist))
                     (or (null file)
                         (if (stringp dired-directory)
                             (let ((wildcards (file-name-nondirectory
					       dired-directory)))
			       (or (zerop (length wildcards))
                                   (string-match-p (dired-glob-regexp wildcards)
                                                   file)))
                           (member (expand-file-name file dir)
                                   (cdr dired-directory)))))
            (setq result (cons buf result)))))))
    result))
  ;; END OF WORKAROUND
  )

(use-package dired-subtree
  :after dired
  :bind (:map dired-mode-map
              ("TAB" . dired-subtree-toggle)))

(use-package dired-narrow
  :after dired
  :bind (:map dired-mode-map
              ("C-s" . dired-narrow))

  :custom
  (dired-narrow-exit-action 'dired-narrow-find-file)
  (dired-narrow-exit-when-one-left nil))

(provide 'siren-dired)
;;; siren-dired.el ends here
