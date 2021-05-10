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

    (subword-mode +1)))

(use-package lsp-lua
  :straight lsp-mode

  :hook
  (lua-mode . siren-lsp-lua-mode-setup)

  :custom
  (lsp-lua-hint-enable t)
  (lsp-lua-telemetry-enable nil)

  :init
  (defun siren-lsp-lua-mode-setup ()
    (lsp-deferred)))

(provide 'siren-lua)
;;; siren-lua.el ends here
