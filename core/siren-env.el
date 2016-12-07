;;; siren-env.el --- jimeh's Emacs Siren: Environment variable setup.

;;; Commentary:

;; Setup for various environment variables to ensure external programs are
;; available.

;;; Code:

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'siren-env)
;;; siren-env.el ends here
