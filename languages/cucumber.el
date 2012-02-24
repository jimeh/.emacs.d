(add-to-list 'auto-mode-alist '("\\.feature" . feature-mode))

(add-hook 'feature-mode-hook
          (lambda ()
            (setq whitespace-action (quote (auto-cleanup)))
            (flyspell-mode)
            (linum-mode t)
            (fci-mode)))
