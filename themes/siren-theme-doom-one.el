;;; siren-theme-doom-one.el --- jimeh's Emacs Siren: doom-one theme.

;;; Commentary:

;; Setup for doom-one theme.

;;; Code:

(require 'siren-all-the-icons)
(require 'siren-doom-modeline)

(use-package doom-themes
  :ensure t

  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)    ; if nil, bold is universally disabled
  (doom-themes-enable-italic t)  ; if nil, italics is universally disabled
  (doom-one-brighter-comments nil)
  (doom-one-brighter-modeline nil)
  (doom-one-comment-bg t)
  (doom-one-padded-modeline nil)

  :config
  ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
  ;; theme may have their own settings.
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme
  (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

  ;; Corrects (and improves) org-mode's native fontification.
  ;; (doom-themes-org-config)

  ;; Override some of doom-one's colors.
  (setq fci-rule-color (doom-color 'base3))
  (set-face-attribute 'hideshowvis-hidable-face nil
                      :foreground (doom-color 'base7))
  (set-face-attribute 'font-lock-variable-name-face nil
                      :foreground (doom-lighten (doom-color 'blue) 0.25))
  (set-face-attribute 'vertical-border nil
                      :foreground (doom-darken (doom-color 'vertical-bar) 0.1)))

(provide 'siren-theme-doom-one)
;;; siren-theme-doom-one.el ends here
