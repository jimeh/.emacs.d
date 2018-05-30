;;; siren-theme-doom-vibrant.el --- jimeh's Emacs Siren: doom-vibrant theme.

;;; Commentary:

;; Setup for doom-vibrant theme.

;;; Code:

(require 'siren-all-the-icons)

(use-package doom-themes
  :ensure t
  :config

  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t  ; if nil, italics is universally disabled
        doom-vibrant-brighter-comments nil
        doom-vibrant-brighter-modeline nil
        doom-vibrant-comment-bg t
        doom-vibrant-padded-modeline nil)

  ;; Load the theme (doom-vibrant, doom-molokai, etc); keep in mind that each
  ;; theme may have their own settings.
  (load-theme 'doom-vibrant t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme
  (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

  ;; Corrects (and improves) org-mode's native fontification.
  ;; (doom-themes-org-config)

  ;; Override some of doom-vibrant's colors.
  (setq fci-rule-color (doom-color 'base3))
  (set-face-attribute 'hideshowvis-hidable-face nil
                      :foreground (doom-color 'base7))
  (set-face-attribute 'font-lock-variable-name-face nil
                      :foreground (doom-lighten (doom-color 'blue) 0.25))
  (set-face-attribute 'vertical-border nil
                      :foreground (doom-darken (doom-color 'vertical-bar) 0.1)))

(use-package hlinum
  :hook (linum-mode . hlinum-activate))

(provide 'siren-theme-doom-vibrant)
;;; siren-theme-doom-vibrant.el ends here
