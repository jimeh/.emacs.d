;;; siren-copilot.el --- jimeh's Emacs Siren: copilot configuration.

;;; Commentary:

;; Basic configuration for copilot. Auto completion on steroids.

;;; Code:

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el"
                   :files ("dist" "*.el"))
  :hook
  (prog-mode . copilot-mode)

  :general
  ("C-<tab>" 'siren-copilot-accept-completion-without-trailing-opening-curly-bracket-dwim)
  ("<backtab>" 'siren-copilot-accept-completion-without-trailing-opening-curly-bracket-dwim)
  ("M-F" 'siren-copilot-accept-completion-by-word-dwim)
  ("M-E" 'siren-copilot-accept-completion-by-line-dwim)
  (:keymaps 'copilot-completion-map
            "M-N" 'copilot-next-completion
            "M-P" 'copilot-previous-completion)

  :preface
  (defun siren-copilot-accept-completion-dwim ()
    "Accept the current completion or trigger copilot-compilot."
    (interactive)
    (siren-copilot-complete-or-call 'copilot-accept-completion))

  (defun siren-copilot-accept-completion-by-word-dwim ()
    "Accept the current completion by word, or trigger copilot-compilot."
    (interactive)
    (siren-copilot-complete-or-call 'copilot-accept-completion-by-word 1))

  (defun siren-copilot-accept-completion-by-line-dwim ()
    "Accept the current completion by word, or trigger copilot-compilot."
    (interactive)
    (siren-copilot-complete-or-call 'copilot-accept-completion-by-line 1))

  (defun siren-copilot-complete-or-call (f &rest args)
    "Trigger copilot-complete or call F."
    (if (copilot-current-completion)
        (apply f args)
      (copilot-complete)))

  (defun siren-copilot-accept-completion-without-trailing-opening-curly-bracket-dwim ()
    "Accept the current completion or trigger copilot-compilot."
    (interactive)
    (siren-copilot-complete-or-call 'siren-copilot-accept-completion-without-trailing-opening-curly-bracket))

  (defun siren-copilot-accept-completion-without-trailing-opening-curly-bracket ()
    "Accept completion removing ` {' or `{' from the end of the completion."
    (interactive)
    (copilot-accept-completion (lambda (completion)
                                 (let ((index (string-match-p "\s*{\\'" completion)))
                                   (if (and index (> index 0))
                                       (substring completion 0 index)
                                     completion)))))

  :config
  (with-eval-after-load 'company
    ;; Use company popup even when there's only one result
    (when (member 'company-preview-if-just-one-frontend company-frontends)
      (delq 'company-preview-if-just-one-frontend company-frontends)
      (setf (nth (position 'company-pseudo-tooltip-unless-just-one-frontend
                           company-frontends)
                 company-frontends)
            'company-pseudo-tooltip-frontend))))

(provide 'siren-copilot)
;;; siren-copilot.el ends here
