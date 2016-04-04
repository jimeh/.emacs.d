;;; siren-lua.el --- jimeh's Emacs Siren: lua-mode configuration.

;;; Commentary:

;; Basic configuration for lua-mode.

;;; Code:

(require 'siren-programming)

(siren-require-packages '(lua-mode))

(defun siren-lua-mode-defaults ()
  (siren-prog-mode-defaults)

  (highlight-indentation-current-column-mode)
  (setq whitespace-action (quote (auto-cleanup)))
  ;; (define-key lua-mode-map (kbd "RET") 'newline-and-indent)
  )

(setq siren-lua-mode-hook 'siren-lua-mode-defaults)

(add-hook 'lua-mode-hook (lambda ()
                          (run-hooks 'siren-lua-mode-hook)))

(provide 'siren-lua)
;;; siren-lua.el ends here
