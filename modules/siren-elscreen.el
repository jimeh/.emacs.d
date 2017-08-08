;;; siren-elscreen.el --- jimeh's Emacs Siren: elscreen configuration.

;;; Commentary:

;; Basic configuration for elscreen.

;;; Code:

(use-package elscreen
  :bind (("s-}" . elscreen-next)
         ("s-{" . elscreen-previous)

         :map elscreen-map
         ;; Prefix key.
         ("C-z" . elscreen-map)

         ;; Set screen nickname
         ("," . elscreen-screen-nickname)
         ("C-," . elscreen-screen-nickname)

         ;; Toggle screens.
         ("l" . elscreen-toggle)
         ("C-l" . elscreen-toggle)

         ;; Display list of screens.
         (";" . elscreen-display-screen-name-list)
         ("C-;" . elscreen-display-screen-name-list))

  :config
  (use-package elscreen-buffer-group)

  ;; Start ElScreen.
  (elscreen-start))

(provide 'siren-elscreen)
;;; siren-elscreen.el ends here
