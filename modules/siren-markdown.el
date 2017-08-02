;;; siren-markdown.el --- jimeh's Emacs Siren: markdown-mode configuration.

;;; Commentary:

;; Basic configuration for markdown-mode.

;;; Code:

(use-package markdown-mode
  :mode
  "\\.md"
  "\\.mkd"
  "\\.mkdn"
  "\\.mdown"
  "\\.markdown"

  :config
  (setq markdown-command "redcarpet")

  (defun siren-markdown-mode-defaults ()
    (setq whitespace-action nil
          fill-column 80
          markdown-asymmetric-header t)

    (fci-mode)
    (linum-mode t)
    (flyspell-mode)
    (auto-fill-mode)
    (subword-mode)
    (define-key markdown-mode-map (kbd "C-c p") 'markdown-preview))

  (setq siren-markdown-mode-hook 'siren-markdown-mode-defaults)
  (add-hook 'markdown-mode-hook (lambda ()
                                  (run-hooks 'siren-markdown-mode-hook))))

(custom-set-faces
 '(markdown-code-face ((t nil))))

(provide 'siren-markdown)
;;; siren-markdown.el ends here
