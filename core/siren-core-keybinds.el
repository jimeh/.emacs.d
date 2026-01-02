;;; siren-core-keybinds.el --- jimeh's Emacs Siren: Core keybinds support  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Install and configure packages for working with and managing keybinds.

;;; Code:

(use-package general
  :ensure (:wait t)
  :demand t

  :preface
  (defun siren-general-define-key (&rest args)
    "Wrap `general-define-key' in `with-eval-after-load'."
    (with-eval-after-load 'general
      (apply #'general-define-key args))))

(provide 'siren-core-keybinds)
;;; siren-core-keybinds.el ends here
