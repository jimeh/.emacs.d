;;; siren-theme-doom-nord-light.el --- jimeh's Emacs Siren: doom-nord-light theme.

;;; Commentary:

;; Setup for doom-nord-light theme.

;;; Code:

(require 'siren-all-the-icons)
(require 'siren-doom-modeline)

(use-package doom-themes
  :ensure t

  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)    ; if nil, bold is universally disabled
  (doom-themes-enable-italic t)  ; if nil, italics is universally disabled
  (doom-nord-light-brighter-comments nil)
  (doom-nord-light-brighter-modeline nil)
  (doom-nord-light-comment-bg t)
  (doom-nord-light-padded-modeline nil)
  (nlinum-highlight-current-line t)

  :config
  ;; Load the theme (doom-nord-light, doom-molokai, etc); keep in mind that each
  ;; theme may have their own settings.
  (load-theme 'doom-nord-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme
  (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

  ;; Corrects (and improves) org-mode's native fontification.
  ;; (doom-themes-org-config)

  ;; Override some of doom-nord-light's colors.
  (setq fci-rule-color (doom-color 'base3))
  (set-face-attribute 'hideshowvis-hidable-face nil
                      :foreground (doom-color 'base7))
  (set-face-attribute 'font-lock-variable-name-face nil
                      :foreground (doom-lighten (doom-color 'blue) 0.25))
  (set-face-attribute 'vertical-border nil
                      :foreground (doom-darken (doom-color 'vertical-bar) 0.1)))

(provide 'siren-theme-doom-nord-light)
;;; siren-theme-doom-nord.el ends here
