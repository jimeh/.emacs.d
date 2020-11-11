;;; siren-debug-map.el --- jimeh's Emacs Siren: debug-map setup.

;;; Commentary:

;; Setup of siren-debug-map which other debugging modules can add keybindings
;; to.

;;; Code:

(use-package siren-debug-map
  :straight (:type built-in)
  :no-require t

  :bind
  (:prefix-map siren-debug-map
               :prefix "C-c -"))

(provide 'siren-debug-map)
;;; siren-debug-map.el ends here
