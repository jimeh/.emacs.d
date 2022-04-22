;;; siren-coffee.el --- jimeh's Emacs Siren: coffee-mode configuration.

;;; Commentary:

;; Basic configuration for coffee-mode.

;;; Code:

(use-package coffee-mode
  :mode "\\.coffee\\'"
  :interpreter "coffee"

  :hook
  (coffee-mode . siren-coffee-mode-setup)

  :custom
  (coffee-tab-width 2)

  :preface
  (defun siren-coffee-mode-setup ()
    ;; remove the "Generated by CoffeeScript" header
    (add-to-list 'coffee-args-compile "--no-header")

    ;; Update the already compiled js on save
    (and (buffer-file-name)
         (file-exists-p (buffer-file-name))
         (file-exists-p (coffee-compiled-file-name (buffer-file-name)))
         (coffee-cos-mode t))

    (setq tab-width 2)
    (subword-mode +1)))

(provide 'siren-coffee)
;;; siren-coffee.el ends here
