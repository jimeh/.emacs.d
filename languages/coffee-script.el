(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(add-hook 'coffee-mode-hook
          (lambda ()
            (fci-mode)
            (linum-mode t)
            (setq tab-width 2)))
