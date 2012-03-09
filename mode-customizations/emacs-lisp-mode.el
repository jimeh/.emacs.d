;; Lisp Hook
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq whitespace-action (quote (auto-cleanup)))
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)))
