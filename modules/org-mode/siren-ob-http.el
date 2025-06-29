;;; siren-ob-http.el --- jimeh's Emacs Siren: ob-http configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for ob-http.

;;; Code:

(require 'siren-org-mode)

(use-package ob-http
  :defer t

  :hook
  (org-mode . siren-ob-http-setup)

  :preface
  (defun siren-ob-http-setup ()
    (require 'ob-http)))

(provide 'siren-ob-http)
;;; siren-ob-http.el ends here
