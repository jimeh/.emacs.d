;;; siren-savehist.el --- jimeh's Emacs Siren: savehist configuration.

;;; Commentary:

;; Basic configuration for savehist.

;;; Code:

(use-package savehist
  :straight (:type built-in)

  :custom
  (savehist-additional-variables '(search-ring regexp-search-ring))
  (savehist-autosave-interval 60)
  (savehist-file (expand-file-name "savehist" siren-cache-dir))

  :init
  (savehist-mode +1))

(provide 'siren-savehist)
;;; siren-savehist.el ends here
