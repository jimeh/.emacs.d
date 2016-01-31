;;; siren-highlight-symbol.el --- jimeh's Emacs Siren: highlight-symbol configuration.

;;; Commentary:

;; Basic configuration for highlight-symbol.

;;; Code:

(siren-require-packages '(highlight-symbol))

(require 'highlight-symbol)

(setq highlight-symbol-highlight-single-occurrence 'nil)
(setq highlight-symbol-idle-delay 0.5)

(global-set-key (kbd "C-c C-p") 'highlight-symbol-prev)
(global-set-key (kbd "C-c C-n") 'highlight-symbol-next)


(provide 'siren-highlight-symbol)
;;; siren-highlight-symbol.el ends here
