;;; siren-sh.el --- jimeh's Emacs Siren: sh-mode configuration.

;;; Commentary:

;; Basic configuration for sh-mode.

;;; Code:

(use-package sh-script
  :straight (:type built-in)
  :mode
  ("\\.tmux\\'" . sh-mode)
  ("\\.tmuxsh\\'" . sh-mode)
  ("\\.tmuxtheme\\'" . sh-mode)
  ("/zshenv\\'" . sh-mode)
  ("/zshrc\\'" . sh-mode)

  :bind
  (:map sh-mode-map
        ("RET" . newline-and-indent))

  :hook
  (sh-mode . siren-sh-mode-setup)

  :custom
  (sh-basic-offset 2)
  (sh-indentation 2)
  (sh-indent-after-continuation 'always)

  :init
  (defun siren-sh-mode-setup ()
    (setq tab-width 2
          whitespace-action '(auto-cleanup))

    (subword-mode +1)))

(use-package shfmt
  :hook
  (sh-mode . shfmt-on-save-mode)

  :custom
  (shfmt-arguments '("-i" "2" "-ci" "-sr")))

(provide 'siren-sh)
;;; siren-sh.el ends here
