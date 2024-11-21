;;; siren-workspace-map.el --- jimeh's Emacs Siren: workspaces-map setup.

;;; Commentary:

;; Setup of siren-workspace-map which other workspace modules can add
;; keybindings to.

;;; Code:

(define-prefix-command 'siren-workspace-map)
(siren-general-define-key "C-z" 'siren-workspace-map)

(provide 'siren-workspace-map)
;;; siren-workspace-map.el ends here
