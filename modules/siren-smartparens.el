;;; siren-smartparens.el --- jimeh's Emacs Siren: smartparens configuration.

;;; Commentary:

;; Basic configuration for smartparens.

;;; Code:

(use-package smartparens
  :defer t
  :diminish smartparens-mode

  :init
  (defalias 'rw 'sp-rewrap-sexp)
  (show-smartparens-global-mode +1)

  :config
  ;; smart pairing for all
  (require 'smartparens-config)

  (setq sp-base-key-bindings 'paredit
        sp-autoskip-closing-pair 'always
        sp-hybrid-kill-entire-symbol nil)

  (custom-set-faces
   '(sp-pair-overlay-face ((t (:inherit nil)))))

  (sp-pair "{" nil :post-handlers
           '(((lambda (&rest _ignored)
                (siren-smart-open-line-above)) "RET")))

  ;; Keybindings
  (let ((map smartparens-mode-map))
    (define-key map (kbd "C-M-f") 'sp-forward-sexp)
    (define-key map (kbd "C-M-b") 'sp-backward-sexp)
    (define-key map (kbd "C-M-a") 'sp-beginning-of-sexp)
    (define-key map (kbd "C-M-e") 'sp-end-of-sexp)
    (define-key map (kbd "C-M-]") 'sp-forward-slurp-sexp)
    (define-key map (kbd "C-M-[") 'sp-forward-barf-sexp)
    (define-key map (kbd "C-M-.") 'sp-forward-slurp-sexp)
    (define-key map (kbd "C-M-,") 'sp-forward-barf-sexp)
    (define-key map (kbd "s->") 'sp-forward-slurp-sexp)
    (define-key map (kbd "s-<") 'sp-forward-barf-sexp)
    (define-key map (kbd "M-|") 'sp-split-sexp)
    (define-key map (kbd "M-t") 'sp-backward-up-sexp)
    (define-key map (kbd "C-<backspace>") 'sp-backward-kill-sexp)
    (define-key map (kbd "C-<delete>") 'sp-kill-sexp)))

(provide 'siren-smartparens)
;;; siren-smartparens.el ends here
