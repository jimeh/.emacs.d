;;; siren-flyspell.el --- jimeh's Emacs Siren: flyspell configuration.

;;; Commentary:

;; Basic configuration for flyspell.

;;; Code:

(require 'flyspell)
(diminish 'flyspell-mode)
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))

(global-set-key (kbd "s-.") 'flyspell-correct-word-before-point)

(provide 'siren-flyspell)
;;; siren-flyspell.el ends here
