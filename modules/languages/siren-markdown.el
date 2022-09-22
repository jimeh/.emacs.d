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

    (setq-local markdown-asymmetric-header t)

    (siren-display-fill-column t)
    (siren-display-line-numbers t)
    (auto-fill-mode t)
    (prettier-js-mode t)
    (flyspell-mode t)
    (smartparens-mode t)
    (subword-mode t))

  (defun siren-markdown-mode-setup-prettier ()
    (let ((args '("--parser" "markdown")))
      (when (bound-and-true-p auto-fill-function) ;; is auto-fill-mode enabled?
        (setq args (append args (list "--print-width" (format "%d" fill-column)
                                      "--prose-wrap" "always"))))

      (setq-local prettier-js-args args))))

;; Required by markdown-edit-code-block.
(use-package edit-indirect
  :defer t)

(use-package vmd-mode
  :defer t)

(provide 'siren-markdown)
;;; siren-markdown.el ends here
