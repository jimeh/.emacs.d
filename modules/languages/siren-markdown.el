;;; siren-markdown.el --- jimeh's Emacs Siren: markdown-mode configuration.

;;; Commentary:

;; Basic configuration for markdown-mode.

;;; Code:

(require 'siren-display-fill-column)
(require 'siren-display-line-numbers)
(require 'siren-flyspell)
(require 'siren-move-dup)
(require 'siren-polymode)
(require 'siren-prettier-js)
(require 'siren-smartparens)

(use-package markdown-mode
  :mode
  "\\.md"
  "\\.mkd"
  "\\.mkdn"
  "\\.mdown"
  "\\.markdown"

  :bind
  (:map markdown-mode-map
        ("C-c p" . markdown-preview)
        ("M-p" . md-move-lines-up)
        ("M-n" . md-move-lines-down)
        ("M-P" . markdown-previous-link)
        ("M-N" . markdown-next-link))

  :hook
  (markdown-mode . siren-markdown-mode-setup)

  :custom
  (markdown-command "pandoc -f gfm -t html5")

  :custom-face
  (markdown-code-face ((t nil)))

  :init
  (defun siren-markdown-mode-setup ()
    (setq-local markdown-asymmetric-header t
                prettier-js-args '("--print-width" "80"
                                   "--prose-wrap" "always")
                whitespace-action nil)

    (siren-display-fill-column)
    (siren-display-line-numbers)
    (auto-fill-mode)
    (prettier-js-mode)
    (flyspell-mode)
    (smartparens-mode +1)
    (subword-mode)))

;; Required by markdown-edit-code-block.
(use-package edit-indirect
  :defer t)

(provide 'siren-markdown)
;;; siren-markdown.el ends here
