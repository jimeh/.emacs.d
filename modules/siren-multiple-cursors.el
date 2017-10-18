;;; siren-multiple-cursors.el --- jimeh's Emacs Siren: multiple-cursors configuration.

;;; Commentary:

;; Basic configuration for multiple-cursors.

;;; Code:

(require 'siren-phi-search)

(use-package multiple-cursors
  :bind
  ("C-x C-@" . mc/edit-lines) ;; Terminal
  ("M-/" . mc/mark-next-like-this)
  ("M-m" . mc/mark-previous-like-this)
  ("C-c M-/" . mc/mark-all-like-this)
  ("M-RET" . set-rectangular-region-anchor)

  :config
  (setq mc/edit-lines-empty-lines 'ignore)

  ;; Make alt-<click> add additional cursors
  (global-unset-key (kbd "M-<down-mouse-1>")) ;; must unset key first
  (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click))

(provide 'siren-multiple-cursors)
;;; siren-multiple-cursors.el ends here
