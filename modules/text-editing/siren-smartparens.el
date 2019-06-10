;;; siren-smartparens.el --- jimeh's Emacs Siren: smartparens configuration.

;;; Commentary:

;; Basic configuration for smartparens.

;;; Code:

(use-package smartparens
  :defer t
  :diminish smartparens-mode
  :bind (:map smartparens-mode-map
              ("C-M-t" . sp-transpose-sexp)
              ("C-M-r" . sp-transpose-sexp-reverse)
              ("C-M-f" . sp-forward-sexp)
              ("C-M-b" . sp-backward-sexp)
              ("C-M-a" . sp-beginning-of-sexp)
              ("C-M-e" . sp-end-of-sexp)
              ("C-M-]" . sp-forward-slurp-sexp)
              ("C-M-[" . sp-forward-barf-sexp)
              ("C-M-." . sp-forward-slurp-sexp)
              ("C-M-," . sp-forward-barf-sexp)
              ("s->" . sp-forward-slurp-sexp)
              ("s-<" . sp-forward-barf-sexp)
              ("M-|" . sp-split-sexp)
              ("M-t" . sp-backward-up-sexp)
              ("C-<backspace>" . sp-backward-kill-sexp)
              ("C-<delete>" . sp-kill-sexp))

  :hook
  (prog-mode . smartparens-mode)

  :custom-face
  (sp-pair-overlay-face ((t (:inherit nil))))

  :custom
  (sp-base-key-bindings 'paredit)
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
