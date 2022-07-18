;;; siren-xml.el --- jimeh's Emacs Siren: XML editing configuration.

;;; Commentary:

;; Basic configuration for XML editing.

;;; Code:

(require 'siren-prettier-js)
(require 'siren-prog-mode)

(use-package nxml-mode
  :straight (:type built-in)
  :defer t
  :hook (nxml-mode . siren-xml-setup)

  :custom
  (nxml-attribute-indent 2)
  (nxml-child-indent 2)

  :preface
  (defun siren-xml-setup ()
    (run-hooks 'prog-mode-hook)
    (setq-local tab-width 2)
    (prettier-js-mode)))

(provide 'siren-xml)
;;; siren-xml.el ends here
