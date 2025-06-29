;;; siren-helpful.el --- jimeh's Emacs Siren: helpful configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for helpful.

;;; Code:

(use-package helpful
  :general
  ("C-h k" 'helpful-key)
  ("C-h f" 'helpful-callable)
  ("C-h v" 'helpful-variable)
  ("C-h C" 'helpful-command)
  ("C-h F" 'helpful-function)
  (:keymaps 'emacs-lisp-mode-map
            "C-c C-d" 'helpful-at-point)

  :custom
  (helm-describe-function-function 'helpful-function)
  (helm-describe-variable-function 'helpful-variable)

  :config
  ;; TODO: Follow up on this workaround for the removal of the
  ;; `read-symbol-positions-list' variable in Emacs 29.x. More details:
  ;; https://github.com/Wilfred/elisp-refs/issues/35
  (when (not (version< emacs-version "29.0"))
    (defvar read-symbol-positions-list nil))

  ;; TODO: Follow up this workaround required due to `help-fns--autoloaded-p'
  ;; being changed to only accept a single argument in Emacs 29.x in commit:
  ;; https://github.com/emacs-mirror/emacs/commit/1d1b664fbb9232aa40d8daa54a689cfd63d38aa9
  (defun helpful--autoloaded-p (sym _buf)
    "Return non-nil if function SYM is autoloaded."
    (help-fns--autoloaded-p sym)))

(provide 'siren-helpful)
;;; siren-helpful.el ends here
