(add-hook 'python-mode-hook
          (lambda ()
            (fci-mode)
            (linum-mode t)
            (define-key python-mode-map (kbd "RET") 'newline-and-indent)))
