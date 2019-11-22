;;; siren-js.el --- jimeh's Emacs Siren: js-mode configuration.

;;; Commentary:

;; Basic configuration for js-mode.

;;; Code:

(require 'siren-prettier-js)
(require 'siren-folding)

(use-package js-mode
  :ensure nil ;; loaded from emacs built-ins
  :mode
  "\\.js\\'"
  "\\.pac\\'"

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
    (company-mode +1)
    (lsp)
    (subword-mode +1)
    (hs-minor-mode 1)
    (highlight-indentation-current-column-mode)
    (hideshowvis-enable)

    (let ((map js-mode-map))
      (define-key map (kbd "C-j") 'newline-and-indent)
      (define-key map (kbd "C-c C-h") 'siren-toggle-hiding))))

(provide 'siren-js)
;;; siren-js.el ends here
