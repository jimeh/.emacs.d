;;; siren-dap.el --- jimeh's Emacs Siren: dap-mode configuration.

;;; Commentary:

;; Basic configuration for dap-mode.

;;; Code:

(require 'siren-debug-map)
(require 'siren-hydra)

(use-package dap-mode
  :defer t

  :bind (:map siren-debug-map
              ("d" . dap-debug)
              ("t" . dap-breakpoint-toggle)
              ("c" . dap-breakpoint-condition)
              ("h" . dap-breakpoint-hit-condition)
              ("m" . dap-breakpoint-log-message)
              ("l" . dap-ui-breakpoints-list)
              ("b" . dap-ui-breakpoints))

  :custom
  (dap-auto-configure-features '(sessions locals controls tooltip))

  :config
  (dap-auto-configure-mode t)
  (add-hook 'dap-stopped-hook
            (lambda (arg) (call-interactively #'dap-hydra))))

(provide 'siren-dap)
;;; siren-dap.el ends here
