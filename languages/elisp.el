;; Lisp Hook
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (setq whitespace-action (quote (auto-cleanup)))
            (column-marker-1 80)))
