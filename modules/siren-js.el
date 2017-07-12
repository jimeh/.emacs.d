;;; siren-js.el --- jimeh's Emacs Siren: js-mode configuration.

;;; Commentary:

;; Basic configuration for js-mode.

;;; Code:

(siren-require-packages '(eslintd-fix))

(require 'siren-programming)
(require 'eslintd-fix)

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js-mode))
(add-to-list 'interpreter-mode-alist '("node" . js-mode))

(defun siren-js-mode-defaults ()
  "Default tweaks for `js-mode'."
  (let ((indent-width 2))
    (setq js-indent-level indent-width)
    (setq indent-level indent-width)
    (setq tab-width indent-width))
  (setq flycheck-checker 'javascript-eslint)
  (setq flycheck-javascript-eslint-executable "eslint_d")

  (siren-prog-mode-defaults)
  (eslintd-fix-mode)
  (company-mode +1)
  (subword-mode +1)
  (hs-minor-mode 1)
  (highlight-indentation-current-column-mode)
  (hideshowvis-enable)

  (let ((map js-mode-map))
    (define-key map (kbd "C-j") 'newline-and-indent)
    (define-key map (kbd "C-c C-h") 'siren-toggle-hiding)))

(setq siren-js-mode-hook 'siren-js-mode-defaults)

(add-hook 'js-mode-hook (lambda ()
                          (run-hooks 'siren-js-mode-hook)))
(add-hook 'before-save-hook 'jsfmt-before-save)

(provide 'siren-js)
;;; siren-js.el ends here
