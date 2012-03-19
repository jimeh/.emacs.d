(add-hook 'magit-log-edit-mode-hook
          (lambda ()
            (flyspell-mode)
            (linum-mode t)
            (auto-fill-mode)
            (setq fill-column 72)
            (fci-mode)))
