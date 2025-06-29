;;; siren-auto-complete.el --- jimeh's Emacs Siren: auto-complete configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for auto-complete.

;;; Code:

(require 'siren-flyspell)

(use-package auto-complete
  :general
  (:keymaps 'ac-completing-map
            "RET" 'ac-complete
            "C-m" 'ac-complete
            "C-s" 'ac-isearch
            "C-n" 'ac-next
            "C-p" 'ac-previous)

  :custom
  (ac-auto-show-menu 0.2)
  (ac-auto-start 3)
  (ac-delay 0.05)
  (ac-menu-height 15)

  :config
  (ac-flyspell-workaround)

  ;; Auto-complete when indenting.
  (defadvice indent-for-tab-command (around ac-before-indent activate)
    "Call `auto-complete' if text was recently entered."
    (if (ac-trigger-command-p last-command)
        (auto-complete)
      ad-do-it)))

(provide 'siren-auto-complete)
;;; siren-auto-complete.el ends here
