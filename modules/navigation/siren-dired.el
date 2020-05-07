;;; siren-dired.el --- jimeh's Emacs Siren: dired configuration.

;;; Commentary:

;; Basic configuration for dired.

;;; Code:

(use-package dired
  :straight (:type built-in)

  :config
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
  :straight (:type built-in))

(use-package dired+
  :demand t
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

(provide 'siren-dired)
;;; siren-dired.el ends here
