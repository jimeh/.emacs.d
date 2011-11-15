(add-hook 'js-mode-hook
          (lambda ()
            (fci-mode)
            (linum-mode t)
            (setq tab-width 2)))
