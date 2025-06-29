;;; siren-company-prescient.el --- jimeh's Emacs Siren: company-prescient configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for company-prescient.

;;; Code:

(require 'siren-company)
(require 'siren-prescient)

(use-package company-prescient
  :defer t
  :after (prescient company)

  :config
  (company-prescient-mode +1))

(provide 'siren-company-prescient)
;;; siren-company-prescient.el ends here
