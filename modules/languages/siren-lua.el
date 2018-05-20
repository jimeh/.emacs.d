;;; siren-lua.el --- jimeh's Emacs Siren: lua-mode configuration.

;;; Commentary:

;; Basic configuration for lua-mode.

;;; Code:

(use-package lua-mode
  :hook
  (lua-mode . siren-lua-mode-setup)

  :init
  (defun siren-lua-mode-setup ()
    (setq lua-indent-level 2
          whitespace-action '(auto-cleanup))

    (highlight-indentation-current-column-mode)
    (subword-mode +1)))

(provide 'siren-lua)
;;; siren-lua.el ends here
