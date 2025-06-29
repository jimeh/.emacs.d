;;; siren-mise.el --- jimeh's Emacs Siren: mise configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for mise.

;;; Code:

(use-package mise
  :hook
  (after-init . global-mise-mode))

(provide 'siren-mise)
;;; siren-mise.el ends here
