(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

(add-hook 'markdown-mode-hook
          (lambda ()
            (setq whitespace-action nil)
            (fci-mode)
            (flyspell-mode 1)
            (define-key markdown-mode-map (kbd "C-c p") 'markdown-preview)))
