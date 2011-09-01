(add-to-list 'auto-mode-alist '("\\.feature" . feature-mode))

(add-hook 'feature-mod-hook
          (lambda ()
            (setq whitespace-action (quote (auto-cleanup)))))
