;;; siren-markdown.el --- jimeh's Emacs Siren: markdown-mode configuration.

;;; Commentary:

;; Basic configuration for markdown-mode.

;;; Code:

(require 'siren-display-fill-column)
(require 'siren-display-line-numbers)
(require 'siren-move-dup)

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
    (when (fboundp 'prettier-js-mode)
      (add-hook 'hack-local-variables-hook
                'siren-markdown-mode-setup-prettier nil t))

    (setq-local markdown-asymmetric-header t
                tab-width 2)

    (siren-display-fill-column t)
    (siren-display-line-numbers t)
    (auto-fill-mode t))

  (defun siren-markdown-mode-setup-prettier ()
    "Configure prettier-js-args based on auto-fill-column mode."
    (let ((args (if (boundp 'prettier-js-args) prettier-js-args '())))
      (setq args (append args '("--parser" "markdown")))
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
