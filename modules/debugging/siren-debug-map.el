;;; siren-debug-map.el --- jimeh's Emacs Siren: debug-map setup.

;;; Commentary:

;; Setup of siren-debug-map which other debugging modules can add keybindings
;; to.

;;; Code:

(define-prefix-command 'siren-debug-map)
(general-define-key "C-c -" 'siren-debug-map)

(provide 'siren-debug-map)
;;; siren-debug-map.el ends here
