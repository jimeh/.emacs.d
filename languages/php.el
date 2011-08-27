(add-hook 'php-mode-hook
          (lambda ()
            (setq whitespace-action (quote (auto-cleanup)))
            (column-marker-1 80)))
