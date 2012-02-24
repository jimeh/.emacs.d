(add-hook 'js-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)
            (setq tab-width 2)))
