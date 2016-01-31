;;; siren-volatile-highlights.el --- jimeh's Emacs Siren: volatile-highlights-mode configuration.

;;; Commentary:

;; Basic configuration for volatile-highlights-mode.

;;; Code:

(siren-require-packages '(volatile-highlights))

(require 'volatile-highlights)
(volatile-highlights-mode t)
(diminish 'volatile-highlights-mode)

(provide 'siren-volatile-highlights)
;;; siren-volatile-highlights.el ends here
