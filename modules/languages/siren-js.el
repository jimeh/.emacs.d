;;; siren-js.el --- jimeh's Emacs Siren: js-mode configuration.

;;; Commentary:

;; Basic configuration for js-mode.

;;; Code:

(require 'siren-company)
(require 'siren-folding)
(require 'siren-lsp)
(require 'siren-prettier-js)

(use-package js-mode
  :straight (:type built-in)
  :mode
  "\\.js\\'"
  "\\.pac\\'"

  :bind (:map js-mode-map
              ("C-j" . newline-and-indent)
              ("C-c C-h" . siren-toggle-hiding))

  :hook
  (js-mode . siren-js-mode-setup)

  :init
  (defun siren-js-mode-setup ()
    "Default tweaks for `js-mode'."
    (let ((width 2))
      (setq js-indent-level width
            indent-level width
            tab-width width))

    (prettier-js-mode)
    (company-mode)
    (lsp-deferred)
    (subword-mode)
    (siren-folding)))

(provide 'siren-js)
;;; siren-js.el ends here
