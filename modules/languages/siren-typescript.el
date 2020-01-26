;;; siren-typescript.el --- jimeh's Emacs Siren: typescript-mode configuration.

;;; Commentary:

;; Basic configuration for typescript-mode.

;;; Code:

(require 'siren-company)
(require 'siren-folding)
(require 'siren-flycheck)
(require 'siren-prettier-js)
(require 'siren-web-mode)

(use-package typescript-mode
  :hook
  (typescript-mode . siren-typescript-mode-setup)

  :init

  (defun siren-typescript-mode-setup ()
    (let ((width 2))
      (setq typescript-indent-level width
            indent-level width
            tab-width width))

    (company-mode +1)
    (lsp)
    (subword-mode +1)
    (hs-minor-mode 1)
    (hideshowvis-enable)

    (let ((map typescript-mode-map))
      (define-key map (kbd "C-j") 'newline-and-indent)
      (define-key map (kbd "C-c C-h") 'siren-toggle-hiding))))

(use-package tide
  :hook
  (typescript-mode . siren-tide-mode-setup)
  (web-mode . siren-tide-web-mode-setup)

  :init
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (eval-after-load 'flycheck
    '(progn
       (flycheck-add-mode 'typescript-tslint 'web-mode)))

  (defun siren-tide-web-mode-setup ()
    (when (string-equal "tsx" (file-name-extension buffer-file-name))
      (siren-tide-mode-setup)))

  (defun siren-tide-mode-setup ()
    (interactive)
    (tide-setup)

    (setq flycheck-check-syntax-automatically '(save mode-enabled)
          company-tooltip-align-annotations t)

    (prettier-js-mode +1)
    (flycheck-mode +1)
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))

  :config
  ;; (add-hook 'before-save-hook #'tide-format-before-save)
  )

(provide 'siren-typescript)
;;; siren-typescript.el ends here
