;;; siren-dired.el --- jimeh's Emacs Siren: dired configuration.

;;; Commentary:

;; Basic configuration for dired.

;;; Code:

(use-package dired+
  :ensure nil ;; loaded from vendor
  :demand
  :bind (:map dired-mode-map
              ("c" . dired-create-directory)
              ("C-l" . diredp-up-directory-reuse-dir-buffer))

  :hook
  (dired-mode . siren-dired-mode-setup)

  :init
  (defun siren-dired-mode-setup ()
    (toggle-diredp-find-file-reuse-dir 1))

  :config
  (unbind-key "M-i" dired-mode-map)
  (unbind-key "M-l" dired-mode-map))

(provide 'siren-dired)
;;; siren-dired.el ends here
