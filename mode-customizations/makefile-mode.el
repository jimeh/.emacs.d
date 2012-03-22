(add-hook 'makefile-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)
            (highlight-indentation-mode)))
