;;; siren-markdown.el --- jimeh's Emacs Siren: markdown-mode configuration.

;;; Commentary:

;; Basic configuration for markdown-mode.

;;; Code:

(require 'siren-fci)
(require 'siren-flyspell)
(require 'siren-linum)
(require 'siren-move-dup)
(require 'siren-smartparens)

(use-package markdown-mode
  :mode
  "\\.md"
  "\\.mkd"
  "\\.mkdn"
  "\\.mdown"
  "\\.markdown"

  :bind (:map markdown-mode-map
              ("C-c p" . markdown-preview)
              ("M-p" . md-move-lines-up)
              ("M-n" . md-move-lines-down)
              ("M-P" . markdown-previous-link)
              ("M-N" . markdown-next-link))

  :hook
  (markdown-mode . siren-markdown-mode-setup)

  :init
  (defun siren-markdown-mode-setup ()
    (setq markdown-asymmetric-header t
          whitespace-action nil)

    (auto-fill-mode)
    (fci-mode)
    (flyspell-mode)
    (linum-mode t)
    (smartparens-mode +1)
    (subword-mode))

  :config
  (setq markdown-command "redcarpet")
  (custom-set-faces '(markdown-code-face ((t nil)))))

(provide 'siren-markdown)
;;; siren-markdown.el ends here
