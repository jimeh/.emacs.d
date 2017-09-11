;;; siren-lua.el --- jimeh's Emacs Siren: lua-mode configuration.

;;; Commentary:

;; Basic configuration for lua-mode.

;;; Code:

(use-package lua-mode
  :config
  (require 'siren-programming)

  (defun siren-lua-mode-defaults ()
    (siren-prog-mode-defaults)

    (highlight-indentation-current-column-mode)
    (subword-mode +1)
    (setq lua-indent-level 2
          whitespace-action (quote (auto-cleanup))))

  (setq siren-lua-mode-hook 'siren-lua-mode-defaults)
  (add-hook 'lua-mode-hook (lambda ()
                             (run-hooks 'siren-lua-mode-hook))))

(provide 'siren-lua)
;;; siren-lua.el ends here
