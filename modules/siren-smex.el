;;; siren-smex.el --- jimeh's Emacs Siren: smex.

;;; Commentary:

;; Replace M-x with the more powerful smex.

;;; Code:

(siren-require-packages '(smex))

;;; smex, remember recently and most frequently used commands
(require 'smex)
(setq smex-save-file (expand-file-name ".smex-items" siren-savefile-dir))
(smex-initialize)

;; Keybindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(provide 'siren-smex)
;;; siren-smex.el ends here
