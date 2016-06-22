;;; siren-highlight-indentation.el --- jimeh's Emacs Siren: highlight-indentation-mode configuration.

;;; Commentary:

;; Basic configuration for highlight-indentation-mode.

;;; Code:

(siren-require-packages '(highlight-indentation highlight-indent-guides))

(require 'highlight-indentation)
(require 'highlight-indent-guides)

(diminish 'highlight-indentation-mode)
(diminish 'highlight-indentation-current-column-mode)


(provide 'siren-highlight-indentation)
;;; siren-highlight-indentation.el ends here
