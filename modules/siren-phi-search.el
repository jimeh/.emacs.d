;;; siren-phi-search.el --- jimeh's Emacs Siren: phi-search configuration.

;;; Commentary:

;; Basic configuration for phi-search.

;;; Code:

(siren-require-packages '(phi-search))

(require 'phi-search)
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)

(provide 'siren-phi-search)
;;; siren-phi-search.el ends here
