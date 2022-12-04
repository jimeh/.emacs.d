;;; siren-typescript.el --- jimeh's Emacs Siren: typescript-mode configuration.

;;; Commentary:

;; Basic configuration for typescript-mode.

;;; Code:

(require 'siren-flycheck)
(require 'siren-lsp)
(require 'siren-web-mode)

(use-package typescript-mode
  :defer t
  :mode "\\.ts\\'"
  :hook
  (typescript-mode . siren-typescript-mode-setup)

  :general
  (:keymaps 'typescript-mode-map
            "C-j" 'newline-and-indent)

  :preface
  (defun siren-typescript-mode-setup ()
    (let ((width 2))
      (setq-local typescript-indent-level width
                  indent-level width
                  tab-width width))

    (lsp-deferred)
    (flycheck-mode t)))

(use-package tide
  :hook
  (typescript-mode . siren-tide-mode-setup)
  (web-mode . siren-tide-web-mode-setup)

  :preface
  (defun siren-tide-web-mode-setup ()
    (when (string-equal "tsx" (file-name-extension buffer-file-name))
      (siren-tide-mode-setup)))

  (defun siren-tide-mode-setup ()
    (interactive)
    (tide-setup)

    (setq-local flycheck-check-syntax-automatically '(save mode-enabled)
                company-tooltip-align-annotations t)

    (eldoc-mode t)
    (tide-hl-identifier-mode t))

  :init
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'typescript-tslint 'web-mode)))

(provide 'siren-typescript)
;;; siren-typescript.el ends here
