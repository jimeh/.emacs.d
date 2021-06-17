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
  (unbind-key "M-l" dired-mode-map))

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
