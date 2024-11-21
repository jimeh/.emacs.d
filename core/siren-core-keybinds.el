;;; siren-core-keybinds.el --- jimeh's Emacs Siren: Core keybinds support

;;; Commentary:

;; Install and configure packages for working with and managing keybinds.

;;; Code:

(use-package general
  :demand t

  :preface
  (defun siren-general-define-key (&rest args)
    "Wrap `general-define-key' in `with-eval-after-load'."
    (with-eval-after-load 'general
      (apply #'general-define-key args))))

(provide 'siren-core-keybinds)
;;; siren-core-keybinds.el ends here
