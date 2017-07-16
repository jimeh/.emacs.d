;;; siren-smartparens.el --- jimeh's Emacs Siren: smartparens configuration.

;;; Commentary:

;; Basic configuration for smartparens.

;;; Code:

(siren-require-packages '(smartparens))

;; smart pairing for all
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(custom-set-faces
 '(sp-pair-overlay-face ((t (:inherit nil)))))

(sp-pair "{" nil :post-handlers
         '(((lambda (&rest _ignored)
              (siren-smart-open-line-above)) "RET")))

(show-smartparens-global-mode +1)
(diminish 'smartparens-mode)

;; Aliases
(defalias 'rw 'sp-rewrap-sexp)

;; Keybindings
(let ((map smartparens-mode-map))
  (define-key map (kbd "C-M-f") 'sp-forward-sexp)
  (define-key map (kbd "C-M-b") 'sp-backward-sexp)
  (define-key map (kbd "C-M-a") 'sp-beginning-of-sexp)
  (define-key map (kbd "C-M-e") 'sp-end-of-sexp)
  (define-key map (kbd "C-k") 'sp-kill-hybrid-sexp)
  (define-key map (kbd "M-|") 'sp-split-sexp)
  (define-key map (kbd "M-t") 'sp-backward-up-sexp)
  (define-key map (kbd "C-<backspace>") 'sp-backward-kill-sexp))

(custom-set-faces
 '(sp-pair-overlay-face ((t (:inherit nil)))))

(provide 'siren-smartparens)
;;; siren-smartparens.el ends here
