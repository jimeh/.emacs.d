;;; siren-dired.el --- jimeh's Emacs Siren: dired configuration.

;;; Commentary:

;; Basic configuration for dired.

;;; Code:

(require 'siren-linum)

(use-package dired+
  :ensure nil ;; loaded from vendor
  :demand
  :hook (dired-mode . siren-dired-mode-setup)

  :init
  (defun siren-dired-mode-setup ()
    (linum-mode t)
    (define-key dired-mode-map (kbd "c") 'dired-create-directory)
    (toggle-diredp-find-file-reuse-dir 1)))

(provide 'siren-dired)
;;; siren-dired.el ends here
