;;; siren-markdown.el --- jimeh's Emacs Siren: markdown-mode configuration.

;;; Commentary:

;; Basic configuration for markdown-mode.

;;; Code:

(require 'siren-display-fill-column)
(require 'siren-display-line-numbers)
(require 'siren-flyspell)
(require 'siren-move-dup)
(require 'siren-prettier-js)
(require 'siren-smartparens)
(require 'siren-polymode)

(use-package markdown-mode
  :mode
  "\\.md"
  "\\.mkd"
  "\\.mkdn"
  "\\.mdown"
  "\\.markdown"

  :general
  (:keymaps 'markdown-mode-map
            "C-c p" 'markdown-preview
            "M-p" 'md-move-lines-up
            "M-n" 'md-move-lines-down
            "M-P" 'markdown-previous-link
            "M-N" 'markdown-next-link)

  :hook
  (markdown-mode . siren-markdown-mode-setup)

  :custom
  (markdown-command "pandoc -f gfm -t html5")

  :custom-face
  (markdown-code-face ((t nil)))

  :preface
  (defun siren-markdown-mode-setup ()
    ;; Configure prettier after local vars are processed, allowing local
    ;; override of fill-column and have prettier respect it.
    (add-hook 'hack-local-variables-hook
              'siren-markdown-mode-setup-prettier nil t)

    (setq-local markdown-asymmetric-header t
                whitespace-action nil)

    (siren-display-fill-column)
    (siren-display-line-numbers)
    (auto-fill-mode)
    (prettier-js-mode)
    (flyspell-mode)
    (smartparens-mode +1)
    (subword-mode))

  (defun siren-markdown-mode-setup-prettier ()
    (setq-local prettier-js-args `("--parser" "markdown"
                                   "--print-width" ,(number-to-string fill-column)
                                   "--prose-wrap" "always"))))

;; Required by markdown-edit-code-block.
(use-package edit-indirect
  :defer t)

(use-package poly-markdown
  :ensure t)

(use-package vmd-mode
  :defer t)

(provide 'siren-markdown)
;;; siren-markdown.el ends here
