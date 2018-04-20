;;; siren-markdown.el --- jimeh's Emacs Siren: markdown-mode configuration.

;;; Commentary:

;; Basic configuration for markdown-mode.

;;; Code:

(require 'siren-flyspell)
(require 'siren-smartparens)

(use-package markdown-mode
  :mode
  "\\.md"
  "\\.mkd"
  "\\.mkdn"
  "\\.mdown"
  "\\.markdown"

  :bind (:map markdown-mode-map
              ("C-c p" . markdown-preview))

  :hook
  (markdown-mode . siren-markdown-mode-setup)

  :init
  (defun siren-markdown-mode-setup ()
    (setq whitespace-action nil
          fill-column 80
          markdown-asymmetric-header t)

    (fci-mode)
    (linum-mode t)
    (flyspell-mode)
    (auto-fill-mode)
    (smartparens-mode +1)
    (subword-mode))

  :config
  (setq markdown-command "redcarpet")
  (custom-set-faces '(markdown-code-face ((t nil)))))

(provide 'siren-markdown)
;;; siren-markdown.el ends here
