(add-hook 'php-mode-hook
          (lambda ()
            (setq whitespace-action (quote (auto-cleanup)))
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)))
