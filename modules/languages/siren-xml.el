;;; siren-xml.el --- jimeh's Emacs Siren: XML editing configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for XML editing.

;;; Code:

(require 'siren-prog-mode)

(use-package nxml-mode
  :ensure nil
  :defer t
  :hook (nxml-mode . siren-xml-setup)

  :general
  (:keymaps 'nxml-mode-map
            "C-c C-f" 'xmllint-format-buffer)

  :custom
  (nxml-attribute-indent 2)
  (nxml-child-indent 2)

  :preface
  (defun siren-xml-setup ()
    (run-hooks 'prog-mode-hook)
    (setq-local tab-width 2))

  :config
  (reformatter-define xmllint-format
    :program "xmllint"
    :args '("--format" "-")
    :lighter " XMLlint"))

(provide 'siren-xml)
;;; siren-xml.el ends here
