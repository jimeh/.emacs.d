;;; siren-savehist.el --- jimeh's Emacs Siren: savehist configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for savehist.

;;; Code:

(use-package savehist
  :ensure nil

  :custom
  (savehist-additional-variables '(search-ring regexp-search-ring))
  (savehist-autosave-interval 60)
  (savehist-file (siren-cache-dir "savehist"))

  :init
  (savehist-mode +1))

(provide 'siren-savehist)
;;; siren-savehist.el ends here
