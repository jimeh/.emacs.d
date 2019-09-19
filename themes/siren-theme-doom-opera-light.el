;;; siren-theme-doom-opera-light.el --- jimeh's Emacs Siren: doom-opera-light theme.

;;; Commentary:

;; Setup for doom-opera-light theme.

;;; Code:

(require 'siren-all-the-icons)
(require 'siren-doom-modeline)

(use-package doom-themes
  :ensure t

  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)    ; if nil, bold is universally disabled
  (doom-themes-enable-italic t)  ; if nil, italics is universally disabled
  (doom-opera-light-brighter-comments nil)
  (doom-opera-light-brighter-modeline nil)
  (doom-opera-light-comment-bg t)
  (doom-opera-light-padded-modeline nil)
  (nlinum-highlight-current-line t)

  :config
  ;; Load the theme (doom-opera-light, doom-molokai, etc); keep in mind that each
  ;; theme may have their own settings.
  (load-theme 'doom-opera-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme
  (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

  ;; Corrects (and improves) org-mode's native fontification.
  ;; (doom-themes-org-config)

  ;; Override some of doom-opera-light's colors.
  (setq fci-rule-color (doom-color 'base3))
  (set-face-attribute 'hideshowvis-hidable-face nil
                      :foreground (doom-color 'base7))
  (set-face-attribute 'font-lock-variable-name-face nil
                      :foreground (doom-lighten (doom-color 'blue) 0.25))
  (set-face-attribute 'vertical-border nil
                      :foreground (doom-darken (doom-color 'vertical-bar) 0.1)))

(provide 'siren-theme-doom-opera-light)
;;; siren-theme-doom-opera-light.el ends here
