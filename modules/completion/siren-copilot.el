;;; siren-copilot.el --- jimeh's Emacs Siren: copilot configuration.

;;; Commentary:

;; Basic configuration for copilot. Auto completion on steroids.

;;; Code:

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el"
                   :files ("dist" "copilot.el"))
  :hook
  (prog-mode . copilot-mode)

  :general
  ("C-<tab>" 'copilot-accept-completion)
  ("<backtab>" 'copilot-accept-completion)
  (:keymaps 'company-active-map
            "C-<tab>" 'copilot-accept-completion
            "C-TAB" 'copilot-accept-completion
            "<backtab>" 'copilot-accept-completion)

  :config
  (with-eval-after-load 'company
    (delq 'company-preview-if-just-one-frontend company-frontends)))

(provide 'siren-copilot)
;;; siren-copilot.el ends here
