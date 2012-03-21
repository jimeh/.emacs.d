;; Make Magit it look a bit prettier with my theme
(add-hook 'magit-mode-hook
          (lambda ()
            (linum-mode t)))

;; Write commit messages in style
(add-hook 'magit-log-edit-mode-hook
          (lambda ()
            (flyspell-mode)
            (linum-mode t)
            (auto-fill-mode)
            (setq fill-column 72)
            (fci-mode)))
