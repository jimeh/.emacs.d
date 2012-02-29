(add-hook 'js-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)
            (setq tab-width 2)
            (setq highlight-indentation-offset 2)
            (highlight-indentation-mode)))
