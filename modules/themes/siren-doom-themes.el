;;; siren-doom-themes.el --- jimeh's Emacs Siren: doom-themes.

;;; Commentary:

;; Setup for doom-themes.

;;; Code:

(require 'siren-all-the-icons)
(require 'siren-doom-modeline)

(use-package doom-themes
  :custom
  ;; Initial theme to load.
  (siren-doom-themes-init-theme 'doom-vibrant)

  ;; Global doom-themes options
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
  (siren-doom-themes-load siren-doom-themes-init-theme)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Configure treemacs styling
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  :init
  (defun siren-doom-themes-load (theme)
    (interactive (list (completing-read "Choose theme: "
                                        (siren-doom-themes-list))))

    (mapc #'disable-theme custom-enabled-themes)
    (load-theme (if (string= (type-of theme) "string") (intern theme) theme) t)
    (siren-doom-themes-overrides))

  (defun siren-doom-themes-vibrant-theme ()
    (interactive)
    (siren-doom-themes-load 'doom-vibrant))

  (defun siren-doom-themes-nord-light-theme ()
    (interactive)
    (siren-doom-themes-load 'doom-nord-light))

  (defun siren-doom-themes-list ()
    (seq-filter
     (lambda (n) (string-prefix-p "doom-" (symbol-name n)))
     (custom-available-themes)))

  (defun siren-doom-themes-overrides ()
    (interactive)
    ;; Override some of doom-vibrant's colors.
    (set-face-attribute 'font-lock-variable-name-face nil
                         :foreground (doom-lighten 'blue 0.25))
    (set-face-attribute 'vertical-border nil
                        :foreground (doom-darken 'vertical-bar 0.1)
                        :background (doom-darken 'vertical-bar 0.1))

    (when (not (version< emacs-version "27.0"))
      (set-face-attribute 'fill-column-indicator nil
                          :foreground (doom-lighten 'base3 0.10)))

    (with-eval-after-load 'diff-hl
      (set-face-attribute 'diff-hl-insert nil
                          :foreground (doom-blend 'vc-added 'bg 0.7)
                          :background (doom-blend 'vc-added 'bg 0.2))
      (set-face-attribute 'diff-hl-delete nil
                          :foreground (doom-blend 'vc-deleted 'bg 0.7)
                          :background (doom-blend 'vc-deleted 'bg 0.2))
      (set-face-attribute 'diff-hl-change nil
                          :foreground (doom-blend 'vc-modified 'bg 0.7)
                          :background (doom-blend 'vc-modified 'bg 0.2)))

    (with-eval-after-load 'hideshowvis
      (set-face-attribute 'hideshowvis-hidable-face nil
                          :foreground (doom-color 'base7)))

    (with-eval-after-load 'fill-column-indicator
      (setq fci-rule-color (doom-lighten (doom-color 'base3) 0.10)))))

(provide 'siren-doom-themes)
;;; siren-doom-themes.el ends here
