(add-to-list 'auto-mode-alist '("\\.feature" . feature-mode))

(add-hook 'feature-mode-hook
          (lambda ()
            (fci-mode)
            (linum-mode t)
            (setq whitespace-action (quote (auto-cleanup)))))
