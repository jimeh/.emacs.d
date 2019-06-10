;;; siren-writeroom.el --- jimeh's Emacs Siren: writeroom-mode configuration.

;;; Commentary:

;; Basic configuration for writeroom-mode.

;;; Code:

(use-package writeroom-mode
  :commands
  writeroom-mode
  global-writeroom-mode

  :bind
  (:map writeroom-mode-map
        ("C-M-<" . writeroom-decrease-width)
        ("C-M->" . writeroom-increase-width)
        ("C-M-=" . writeroom-adjust-width))

  :custom
  (writeroom-global-effects nil)
  (writeroom-restore-window-config t)
  (writeroom-width 82))

(provide 'siren-writeroom)
;;; siren-writeroom.el ends here
