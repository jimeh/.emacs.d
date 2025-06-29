;;; siren-tempel.el --- jimeh's Emacs Siren: tempel configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for tempel.

;;; Code:

(use-package tempel
  :general
  ("M-+" 'tempel-complete) ;; Alternative tempel-expand
  ("M-*" 'tempel-insert)
  (:keymaps 'tempel-map
            "C-g" 'tempel-done
            "TAB" 'tempel-next)

  :custom
  (tempel-path (siren-dir "templates/*.el"))

  :hook
  (prog-mode . siren-tempel-setup-capf)
  (text-mode . siren-tempel-setup-capf)
  (lsp-completion-mode . siren-tempel-setup-capf)

  :preface
  (defun siren-tempel-setup-capf ()
    (add-hook 'completion-at-point-functions 'tempel-expand -68 t)))

(provide 'siren-tempel)
;;; siren-tempel.el ends here
