;;; siren-highlight-indentation.el --- jimeh's Emacs Siren: highlight-indentation-mode configuration.

;;; Commentary:

;; Basic configuration for highlight-indentation-mode.

;;; Code:

(siren-require-packages '(highlight-indentation))

(require 'highlight-indentation)
(diminish 'highlight-indentation-mode)
(diminish 'highlight-indentation-current-column-mode)


(provide 'siren-highlight-indentation)
;;; siren-highlight-indentation.el ends here
