;;; siren-dired.el --- jimeh's Emacs Siren: dired configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for dired.

;;; Code:

(require 'siren-dired+)

(use-package dired
  :straight (:type built-in)
  :defer t

  :hook
  (dired-mode . siren-dired-mode-setup)

  :general
  (:keymaps 'dired-mode-map
            "i" 'wdired-change-to-wdired-mode
            "." 'dired-omit-mode
            "c" 'dired-create-directory
            "M-?" 'siren-dired-display-size)

  :custom
  (siren-dired-clean-up-dired-buffers-after-deletion nil)

  :preface
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

  (defgroup siren-dired nil
    "Siren specific options for dired."
    :group 'dired)

  (defcustom siren-dired-clean-up-dired-buffers-after-deletion t
    "Offer to remove dired buffers of the directory files were deleted from."
    :type 'boolean
    :group 'siren-dired)

  :config
  ;; Replace built-in dired buffer cleanup function with a custom patched
  ;; version that allows separately configuring if dired buffers are cleaned up
  ;; along with file buffers. Without this, whenever you delete a file in dired,
  ;; you get prompted if I want to kill the dired buffer you're in in, and most
  ;; of the time you probably want to continue using dired.
  (defun dired-clean-up-after-deletion (fn)
    "Clean up after a deleted file or directory FN.
Removes any expanded subdirectory of deleted directory.  If
`dired-x' is loaded and `dired-clean-up-buffers-too' is non-nil,
kill any buffers visiting those files, prompting for
confirmation.  To disable the confirmation, see
`dired-clean-confirm-killing-deleted-buffers'."
    (save-excursion (and (cdr dired-subdir-alist)
                         (dired-goto-subdir fn)
                         (dired-kill-subdir)))
    ;; Offer to kill buffer of deleted file FN.
    (when (and (featurep 'dired-x) dired-clean-up-buffers-too)
      (let ((buf (get-file-buffer fn)))
        (and buf
             (or (and dired-clean-confirm-killing-deleted-buffers
                      (funcall #'y-or-n-p
                               (format "Kill buffer of %s, too? "
                                       (file-name-nondirectory fn))))
                 (not dired-clean-confirm-killing-deleted-buffers))
             (kill-buffer buf)))
      (let ((buf-list (dired-buffers-for-dir (expand-file-name fn)
                                             nil 'subdirs)))
        (and buf-list
             siren-dired-clean-up-dired-buffers-after-deletion
             (or (and dired-clean-confirm-killing-deleted-buffers
                      (y-or-n-p
                       (format
                        (ngettext "Kill Dired buffer of %s, too? "
                                  "Kill Dired buffers of %s, too? "
                                  (length buf-list))
                        (file-name-nondirectory
                         ;; FN may end in a / if `dired-listing-switches'
                         ;; contains -p, so we need to strip that
                         ;; (bug#48301).
                         (directory-file-name fn)))))
                 (not dired-clean-confirm-killing-deleted-buffers))
             (dolist (buf buf-list)
               (kill-buffer buf))))))

  ;; dired+ needs to explicitly loaded as it advices lots of dired functions to
  ;; work. Without this, the first opened dired window will not have dired+
  ;; active, but all further dired instances will.
  (require 'dired+)

  ;; Set custom ls flags when a GNU ls command is available.
  (let ((gnu-ls-flags "--all --ignore-backups --human-readable -l"))
    (when (string-match-p "^gnu" (symbol-name system-type))
      (setq dired-use-ls-dired t
            dired-listing-switches gnu-ls-flags))

    (when (string= system-type "darwin")
      (let ((gls (executable-find "gls")))
        (when gls
          (setq dired-use-ls-dired t
                insert-directory-program gls
                dired-listing-switches gnu-ls-flags))))))

(use-package dired-x
  :straight (:type built-in)
  :after dired)

(use-package dired-subtree
  :after dired
  :general
  (:keymaps 'dired-mode-map
            "TAB" 'dired-subtree-toggle))

(use-package dired-narrow
  :after dired
  :general
  (:keymaps 'dired-mode-map
            "C-s" 'dired-narrow)

  :custom
  (dired-narrow-exit-action 'dired-narrow-find-file)
  (dired-narrow-exit-when-one-left nil))

(provide 'siren-dired)
;;; siren-dired.el ends here
