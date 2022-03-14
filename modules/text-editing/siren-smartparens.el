;;; siren-smartparens.el --- jimeh's Emacs Siren: smartparens configuration.

;;; Commentary:

;; Basic configuration for smartparens.

;;; Code:

(use-package smartparens
  :defer t
  :diminish smartparens-mode
  :general
  (:keymaps 'smartparens-mode-map
            "C-M-f" 'sp-forward-sexp
            "C-M-b" 'sp-backward-sexp
            "C-M-t" 'sp-transpose-sexp
            "C-M-r" 'sp-transpose-sexp-reverse
            "C-M-a" 'sp-beginning-of-sexp
            "C-M-e" 'sp-end-of-sexp
            "C-M-]" 'sp-forward-slurp-sexp
            "C-M-[" 'sp-forward-barf-sexp
            "C-M-d" 'sp-kill-sexp
            "C-<delete>" 'sp-kill-sexp
            "C-<backspace>" 'sp-backward-kill-sexp
            "M-|" 'sp-split-sexp
            "M-\"" 'sp-join-sexp
            "M-t" 'sp-backward-up-sexp
            "M-R" 'sp-rewrap-sexp)

  :hook
  (prog-mode . smartparens-mode)

  :custom-face
  (sp-pair-overlay-face ((t (:inherit nil))))

  :custom
  (sp-base-key-bindings nil)
  (sp-autoskip-closing-pair 'always)
  (sp-hybrid-kill-entire-symbol nil)

  :config
  ;; smart pairing for all
  (require 'smartparens-config)

  (defun sp-transpose-sexp-reverse ()
    (interactive)
    (sp-transpose-sexp -1))

  (defalias 'rw 'sp-rewrap-sexp)
  (show-smartparens-global-mode +1)

  (sp-pair "{" nil :post-handlers
           '(((lambda (&rest _ignored)
                (siren-smart-open-line-above)) "RET"))))

(provide 'siren-smartparens)
;;; siren-smartparens.el ends here
