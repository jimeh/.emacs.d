;;; siren-typescript.el --- jimeh's Emacs Siren: typescript-mode configuration.

;;; Commentary:

;; Basic configuration for typescript-mode.

;;; Code:

(require 'siren-flycheck)
(require 'siren-lsp)
(require 'siren-origami)
(require 'siren-prettier-js)
(require 'siren-tree-sitter)
(require 'siren-web-mode)

(use-package typescript-mode
  :defer t
  :mode "\\.ts\\'"
  :hook
  (typescript-mode . siren-typescript-mode-setup)

  :general
  (:keymaps 'typescript-mode-map
            "C-j" 'newline-and-indent
            "C-c C-h" 'siren-folding-toggle)

  :preface
  (defun siren-typescript-mode-setup ()
    (let ((width 2))
      (setq-local typescript-indent-level width
                  indent-level width
                  tab-width width))

    (lsp-deferred)
    (subword-mode t)
    (origami-mode t))

  :init
  (with-eval-after-load 'origami
    (add-to-list 'origami-parser-alist
                 '(typescript-mode . origami-c-style-parser))))

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

    (tree-sitter-mode t)
    (prettier-js-mode t)
    (flycheck-mode t)
    (eldoc-mode t)
    (tide-hl-identifier-mode t))

  :init
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'typescript-tslint 'web-mode)))

(provide 'siren-typescript)
;;; siren-typescript.el ends here
