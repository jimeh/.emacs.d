;;; siren-elscreen.el --- jimeh's Emacs Siren: elscreen configuration.

;;; Commentary:

;; Basic configuration for elscreen.

;;; Code:

(use-package elscreen
  :demand
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
  (elscreen-start))

(use-package elscreen-buffer-group :defer t)

(provide 'siren-elscreen)
;;; siren-elscreen.el ends here
