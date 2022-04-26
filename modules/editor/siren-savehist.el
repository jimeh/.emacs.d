;;; siren-savehist.el --- jimeh's Emacs Siren: savehist configuration.

;;; Commentary:

;; Basic configuration for savehist.

;;; Code:

(use-package savehist
  :straight (:type built-in)

  :custom
  (savehist-additional-variables '(search-ring regexp-search-ring))
  (savehist-autosave-interval 60)
  (savehist-file (siren-cache-dir "savehist"))

  :init
  (savehist-mode +1))

(provide 'siren-savehist)
;;; siren-savehist.el ends here
