;;; siren-centaur-tabs.el --- jimeh's Emacs Siren: centaur-tabs configuration.

;;; Commentary:

;; Basic configuration for centaur-tabs.

;;; Code:

(use-package centaur-tabs
  :commands centaur-tabs-mode

  :bind
  ("s-[" . centaur-tabs-backward-tab)
  ("s-]" . centaur-tabs-forward-tab)
  ("s-<" . centaur-tabs-backward-group)
  ("s->" . centaur-tabs-forward-group)

  :custom
  (centaur-tabs-height 32)
  (centaur-tabs-modified-marker "•") ;; Unicode Bullet (0x2022)
  (centaur-tabs-set-bar 'left)
  (centaur-tabs-set-icons t)
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-show-navigation-buttons nil)
  (centaur-tabs-style "bar")

  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (centaur-tabs-group-by-projectile-project))

(provide 'siren-centaur-tabs)
;;; siren-centaur-tabs.el ends here
