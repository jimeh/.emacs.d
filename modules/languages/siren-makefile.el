;;; siren-makefile.el --- jimeh's Emacs Siren: makefile-mode configuration.

;;; Commentary:

;; Basic configuration for makefile-mode.

;;; Code:

(require 'siren-display-indentation)
(require 'siren-makefile-executor)

(use-package make-mode
  :straight (:type built-in)
  :hook
  (makefile-mode . siren-makefile-mode-setup)

  :general
  (:keymaps 'makefile-mode-map
            "C-c C-m" 'makefile-executor-execute-project-target)

  :preface
  (defun siren-makefile-mode-setup ()
    (subword-mode +1)
    (siren-display-indentation -1)
    (setq tab-width 4))

  :init
  (add-to-list 'siren-indent-sensitive-modes 'makefile-mode))

(provide 'siren-makefile)
;;; siren-makefile.el ends here
