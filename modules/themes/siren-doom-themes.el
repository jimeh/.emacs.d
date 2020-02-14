;;; siren-doom-themes.el --- jimeh's Emacs Siren: doom-themes.

;;; Commentary:

;; Setup for doom-themes.

;;; Code:

(require 'siren-all-the-icons)
(require 'siren-doom-modeline)

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)    ; if nil, bold is universally disabled
  (doom-themes-enable-italic t)  ; if nil, italics is universally disabled
  (doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-enable-variable-pitch nil)

  (doom-nord-light-brighter-comments nil)
  (doom-nord-light-brighter-modeline nil)
  (doom-nord-light-comment-bg nil)
  (doom-nord-light-padded-modeline nil)

  (doom-vibrant-brighter-comments nil)
  (doom-vibrant-brighter-modeline nil)
  (doom-vibrant-comment-bg nil)
  (doom-vibrant-padded-modeline nil)

  (nlinum-highlight-current-line t)

  :config
  ;; By default load the doom-vibrant theme.
  (siren-doom-vibrant)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Configure treemacs styling
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  :init
  (defun siren-doom-vibrant ()
    (interactive)
    (load-theme 'doom-vibrant t)
    (siren-doom-themes-overrides))

  (defun siren-doom-nord-light ()
    (interactive)
    (load-theme 'doom-nord-light t)
    (siren-doom-themes-overrides))

  (defun siren-doom-themes-overrides ()
    ;; Override some of doom-vibrant's colors.
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
      (setq fci-rule-color (doom-lighten (doom-color 'base3) 0.10)))))

(provide 'siren-doom-themes)
;;; siren-doom-themes.el ends here
