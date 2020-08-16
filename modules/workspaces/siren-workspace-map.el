;;; siren-workspace-map.el --- jimeh's Emacs Siren: workspaces-map setup.

;;; Commentary:

;; Setup of siren-workspace-map which other workspace modules can add
;; keybindings to.

;;; Code:

(use-package siren-workspace-map
  :straight (:type built-in)
  :no-require t

  :bind
  (:prefix-map siren-workspace-map
               :prefix "C-z"))

(provide 'siren-workspace-map)
;;; siren-workspace-map.el ends here
