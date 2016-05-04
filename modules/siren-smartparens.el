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

(custom-set-faces
 '(sp-pair-overlay-face ((t (:inherit nil)))))

(provide 'siren-smartparens)
;;; siren-smartparens.el ends here
