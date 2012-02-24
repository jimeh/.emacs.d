(add-hook 'sh-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)))
