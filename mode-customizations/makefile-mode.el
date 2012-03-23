(add-hook 'makefile-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)
            (setq tab-width 4)
            (highlight-indentation-mode)))
