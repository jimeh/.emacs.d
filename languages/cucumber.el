(add-to-list 'auto-mode-alist '("\\.feature" . feature-mode))

(add-hook 'feature-mode-hook
          (lambda ()
            (fci-mode)
            (setq whitespace-action (quote (auto-cleanup)))))
