(add-hook 'markdown-mode-hook
          (lambda ()
            (setq whitespace-action nil)
            (flyspell-mode 1)))

(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
