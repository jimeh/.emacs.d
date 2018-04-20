;;; siren-js.el --- jimeh's Emacs Siren: js-mode configuration.

;;; Commentary:

;; Basic configuration for js-mode.

;;; Code:

(require 'siren-eslintd-fix)
(require 'siren-flycheck)
(require 'siren-folding)
(require 'siren-programming)

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js-mode))
(add-to-list 'interpreter-mode-alist '("node" . js-mode))

(defun siren-js-mode-setup ()
  "Default tweaks for `js-mode'."
  (let ((width 2))
    (setq js-indent-level width
          indent-level width
          tab-width width))

  (setq flycheck-checker 'javascript-eslint
        flycheck-javascript-eslint-executable "eslint_d")

  (siren-prog-mode-setup)
  (eslintd-fix-mode)
  (company-mode +1)
  (subword-mode +1)
  (hs-minor-mode 1)
  (highlight-indentation-current-column-mode)
  (hideshowvis-enable)

  (let ((map js-mode-map))
    (define-key map (kbd "C-j") 'newline-and-indent)
    (define-key map (kbd "C-c C-h") 'siren-toggle-hiding)))

(add-hook 'js-mode-hook #'siren-js-mode-setup)

(provide 'siren-js)
;;; siren-js.el ends here
