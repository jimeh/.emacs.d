;;; siren-theme-doom-one.el --- jimeh's Emacs Siren: doom-one theme.

;;; Commentary:

;; Setup for doom-one theme.

;;; Code:

(require 'siren-all-the-icons)
(require 'siren-doom-modeline)
(require 'siren-folding)

(use-package doom-themes
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
  (set-face-foreground 'font-lock-variable-name-face (doom-lighten 'blue 0.25))
  (set-face-foreground 'vertical-border (doom-darken 'vertical-bar 0.1))
  (set-face-background 'vertical-border (doom-darken 'vertical-bar 0.1))

  (when (not (version< emacs-version "27.0"))
    (set-face-foreground 'fill-column-indicator (doom-lighten 'base3 0.10)))

  (with-eval-after-load 'diff-hl
    (set-face-foreground 'diff-hl-insert (doom-blend 'vc-added 'bg 0.7))
    (set-face-background 'diff-hl-insert (doom-blend 'vc-added 'bg 0.2))
    (set-face-foreground 'diff-hl-delete (doom-blend 'vc-deleted 'bg 0.7))
    (set-face-background 'diff-hl-delete (doom-blend 'vc-deleted 'bg 0.2))
    (set-face-foreground 'diff-hl-change (doom-blend 'vc-modified 'bg 0.7))
    (set-face-background 'diff-hl-change (doom-blend 'vc-modified 'bg 0.2)))

  (with-eval-after-load 'hideshowvis
    (set-face-foreground 'hideshowvis-hidable-face (doom-color 'base7)))

  (with-eval-after-load 'fill-column-indicator
    (setq fci-rule-color (doom-lighten (doom-color 'base3) 0.10))))

(provide 'siren-theme-doom-one)
;;; siren-theme-doom-one.el ends here
