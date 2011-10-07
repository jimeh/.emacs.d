(add-hook 'php-mode-hook
          (lambda ()
            (setq whitespace-action (quote (auto-cleanup)))
            (fci-mode)))
