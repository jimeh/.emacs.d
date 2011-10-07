;; Lisp Hook
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (setq whitespace-action (quote (auto-cleanup)))
            (fci-mode)))
