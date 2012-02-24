(add-hook 'python-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)
            (define-key python-mode-map (kbd "RET") 'newline-and-indent)))
