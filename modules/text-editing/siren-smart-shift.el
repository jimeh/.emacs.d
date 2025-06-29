;;; siren-smart-shift.el --- jimeh's Emacs Siren: smart-shift  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Configuration for smart-shift

;;; Code:

(use-package smart-shift
  :general
  ("C-c [" 'smart-shift-left)
  ("C-c ]" 'smart-shift-right)

  :config
  ;; Override default keymap adding support additional keybindings once
  ;; smart-shift is activated.
  (defun smart-shift-override-local-map ()
    "Override local key map for continuous indentation."
    (setq overriding-local-map
          (let ((map (copy-keymap smart-shift-mode-map)))
            (define-key map (kbd "[") 'smart-shift-left)
            (define-key map (kbd "]") 'smart-shift-right)
            (define-key map (kbd "<left>") 'smart-shift-left)
            (define-key map (kbd "<right>") 'smart-shift-right)
            (define-key map (kbd "<up>") 'smart-shift-up)
            (define-key map (kbd "<down>") 'smart-shift-down)
            (define-key map [t] 'smart-shift-pass-through) ;done with shifting
            map))
    (message (propertize "Still in smart-shift key chord..."
                         'face 'error))))

(provide 'siren-smart-shift)
;;; siren-smart-shift.el ends here
