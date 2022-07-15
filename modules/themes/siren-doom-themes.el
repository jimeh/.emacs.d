;;; siren-doom-themes.el --- jimeh's Emacs Siren: doom-themes.

;;; Commentary:

;; Setup for doom-themes.

;;; Code:

(require 'siren-all-the-icons)
(require 'siren-doom-modeline)

(use-package doom-themes
  :custom
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
  (doom-vibrant-padded-modeline nil)

  (nlinum-highlight-current-line t)

  :config
  ;; By default load the doom-vibrant theme.
  (siren-doom-themes-load 'doom-vibrant)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Configure treemacs styling
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  :preface
  (defun siren-doom-themes-load (theme)
    (interactive (list (completing-read "Choose theme: "
                                        (siren-doom-themes-list))))

    ;; disable all themes
    (dolist (theme custom-enabled-themes)
      (when (not (string= theme "use-package"))
        (disable-theme theme)))

    ;; load doom theme
    (load-theme (if (string= (type-of theme) "string") (intern theme) theme) t)

    ;; load overrides theme: ../../themes/siren-doom-themes-overrides-theme.el
    (load-theme 'siren-doom-themes-overrides t)

    ;; execute custom function after loading/switching theme
    (with-eval-after-load 'highlight-indent-guides
      (highlight-indent-guides-auto-set-faces)))

  (defun siren-doom-themes-vibrant-theme ()
    (interactive)
    (siren-doom-themes-load 'doom-vibrant))

  (defun siren-doom-themes-nord-light-theme ()
    (interactive)
    (siren-doom-themes-load 'doom-nord-light))

  (defun siren-doom-themes-list ()
    (seq-filter
     (lambda (n) (string-prefix-p "doom-" (symbol-name n)))
     (custom-available-themes))))

(provide 'siren-doom-themes)
;;; siren-doom-themes.el ends here
