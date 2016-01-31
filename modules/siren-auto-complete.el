;;; siren-auto-complete.el --- jimeh's Emacs Siren: auto-complete configuration.

;;; Commentary:

;; Basic configuration for auto-complete.

;;; Code:

(siren-require-packages '(auto-complete))

(require 'auto-complete)
;; (require 'auto-complete-config)
;; (ac-config-default)
(ac-flyspell-workaround)

(setq ac-auto-show-menu 0.2)
(setq ac-auto-start 3)
(setq ac-delay 0.05)
(setq ac-menu-height 15)

(let ((map ac-completing-map))
  (define-key map (kbd "RET") 'ac-complete)
  (define-key map (kbd "C-m") 'ac-complete)
  (define-key map (kbd "C-s") 'ac-isearch)
  (define-key map (kbd "C-n") 'ac-next)
  (define-key map (kbd "C-p") 'ac-previous))

;; Auto-complete when indenting.
(defadvice indent-for-tab-command (around ac-before-indent activate)
  "Call `auto-complete' if text was recently entered."
  (if (ac-trigger-command-p last-command)
      (auto-complete)
    ad-do-it))

(provide 'siren-auto-complete)
;;; siren-auto-complete.el ends here
