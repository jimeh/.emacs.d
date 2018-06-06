;;; siren-theme-doom-nord.el --- jimeh's Emacs Siren: doom-nord theme.

;;; Commentary:

;; Setup for doom-nord theme.

;;; Code:

(require 'siren-all-the-icons)

(use-package doom-themes
  :ensure t
  :config

  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t  ; if nil, italics is universally disabled
        doom-nord-brighter-comments nil
        doom-nord-brighter-modeline nil
        doom-nord-comment-bg t
        doom-nord-padded-modeline nil
        nlinum-highlight-current-line t)

  ;; Load the theme (doom-nord, doom-molokai, etc); keep in mind that each
  ;; theme may have their own settings.
  (load-theme 'doom-nord t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme
  (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

  ;; Corrects (and improves) org-mode's native fontification.
  ;; (doom-themes-org-config)

  ;; Override some of doom-nord's colors.
  (setq fci-rule-color (doom-color 'base3))
  (set-face-attribute 'hideshowvis-hidable-face nil
                      :foreground (doom-color 'base7))
  (set-face-attribute 'font-lock-variable-name-face nil
                      :foreground (doom-lighten (doom-color 'blue) 0.25))
  (set-face-attribute 'vertical-border nil
                      :foreground (doom-darken (doom-color 'vertical-bar) 0.1)))

(provide 'siren-theme-doom-nord)
;;; siren-theme-doom-nord.el ends here
