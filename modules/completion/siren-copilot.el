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
    ;; Use company popup even when there's only one result
    (delq 'company-preview-if-just-one-frontend company-frontends)
    (setf (nth (position 'company-pseudo-tooltip-unless-just-one-frontend
                         company-frontends)
               company-frontends)
          'company-pseudo-tooltip-frontend)))

(provide 'siren-copilot)
;;; siren-copilot.el ends here
