;;; siren-dired.el --- jimeh's Emacs Siren: dired configuration.

;;; Commentary:

;; Basic configuration for dired.

;;; Code:

;; Loads from vendor.
(require 'dired+)

(defun siren-dired-mode-defaults ()
  (linum-mode t)
  (define-key dired-mode-map (kbd "c") 'dired-create-directory)
  (toggle-diredp-find-file-reuse-dir 1))

(setq siren-dired-mode-hook 'siren-dired-mode-defaults)
(add-hook 'dired-mode-hook (lambda () (run-hooks 'siren-dired-mode-hook)))

(provide 'siren-dired)
;;; siren-dired.el ends here
