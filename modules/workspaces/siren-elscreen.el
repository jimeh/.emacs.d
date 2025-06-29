;;; siren-elscreen.el --- jimeh's Emacs Siren: elscreen configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for elscreen.

;;; Code:

(use-package elscreen
  :demand
  :general
  ("s-}" 'elscreen-next)
  ("s-{" 'elscreen-previous)
  (:keymaps 'elscreen-map
            "C-z" 'elscreen-map
            "," 'elscreen-screen-nickname
            "C-," 'elscreen-screen-nickname
            "l" 'elscreen-toggle
            "C-l" 'elscreen-toggle
            ";" 'elscreen-display-screen-name-list
            "C-;" 'elscreen-display-screen-name-list)

  :config
  (elscreen-start))

(use-package elscreen-buffer-group :defer t)

(provide 'siren-elscreen)
;;; siren-elscreen.el ends here
