;;; siren-embark.el --- jimeh's Emacs Siren: embark configuration.

;;; Commentary:

;; Basic configuration for embark.

;;; Code:

(require 'siren-marginalia)
(require 'siren-consult)

(use-package embark
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-," . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'siren-embark)
;;; siren-embark.el ends here
