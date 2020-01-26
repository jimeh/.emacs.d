;;; siren-markdown.el --- jimeh's Emacs Siren: markdown-mode configuration.

;;; Commentary:

;; Basic configuration for markdown-mode.

;;; Code:

(require 'siren-display-line-numbers)
(require 'siren-fci)
(require 'siren-flyspell)
(require 'siren-move-dup)
(require 'siren-prettier-js)
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

    (siren-display-line-numbers)
    (auto-fill-mode)
    (prettier-js-mode)
    (fci-mode)
    (flyspell-mode)
    (smartparens-mode +1)
    (subword-mode))

  :custom-face
  (markdown-code-face ((t nil)))

  :custom
  (markdown-command "redcarpet"))

(provide 'siren-markdown)
;;; siren-markdown.el ends here
