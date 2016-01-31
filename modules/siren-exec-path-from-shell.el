;;; siren-exec-path-from-shell.el --- jimeh's Emacs Siren: exec-path-from-shell configuration.

;;; Commentary:

;; Basic configuration for exec-path-from-shell.

;;; Code:

(siren-require-packages '(exec-path-from-shell))

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

(provide 'siren-exec-path-from-shell)
;;; siren-exec-path-from-shell.el ends here
