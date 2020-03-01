;;; siren-ido.el --- jimeh's Emacs Siren: ido configuration.

;;; Commentary:

;; Basic configuration for ido.

;;; Code:

(use-package ido
  :straight (:type built-in)

  :custom
  (ido-auto-merge-work-directories-length -1)
  (ido-case-fold t)
  (ido-create-new-buffer 'always)
  (ido-default-file-method 'selected-window)
  (ido-enable-flex-matching t)
  (ido-enable-prefix nil)
  (ido-max-prospects 10)
  (ido-save-directory-list-file (expand-file-name "ido.hist" siren-cache-dir))
  (ido-use-faces nil)
  (ido-use-filename-at-point nil)

  :config
  (ido-mode 1))

(use-package ido-completing-read+
  :custom
  (ido-cr+-auto-update-blacklist t)

  :config
  (ido-ubiquitous-mode 1))

(use-package ido-vertical-mode
  :custom
  (ido-vertical-define-keys "C-n-C-p-up-down-left-right")

  :config
  (ido-vertical-mode 1))

(provide 'siren-ido)
;;; siren-ido.el ends here
