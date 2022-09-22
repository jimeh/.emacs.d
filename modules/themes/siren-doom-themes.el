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
  (if (not (siren-ns-system-appearance))
      (siren-doom-themes-set-appearance 'dark)
    (siren-doom-themes-set-appearance ns-system-appearance)
    (add-hook 'ns-system-appearance-change-functions
              'siren-doom-themes-set-appearance))

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Configure treemacs styling
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  :preface
  (defun siren-ns-system-appearance()
    "Return the system appearance, either `dark', `light', or `nil'.

A return value of `nil' means that the system appearance is could
not be determined. This happens on non-macOS systems, or on macOS
if running Emacs in a terminal."
    (if (boundp 'ns-system-appearance)
        ns-system-appearance
      nil))

  (defgroup siren-doom-themes nil
    "siren-doom-themes customizations."
    :group 'doom-themes)

  (defcustom siren-doom-themes-light-theme 'doom-nord-light
    "The theme to apply when system appearance is light."
        :type '(symbol)
        :group 'siren-doom-themes)

  (defcustom siren-doom-themes-dark-theme 'doom-vibrant
    "The theme to apply when system appearance is dark."
        :type '(symbol)
        :group 'siren-doom-themes)

  (defun siren-doom-themes-set-appearance (appearance)
    "Load theme, taking current system APPEARANCE into consideration."
    (pcase appearance
      ('light (siren-doom-themes-load siren-doom-themes-light-theme t))
      ('dark (siren-doom-themes-load siren-doom-themes-dark-theme t))))

  (defun siren-doom-themes-load (theme &optional no-reapply)
    "Load doom-theme THEME, and apply siren overrides.

If NO-REAPPLY is non-nil, do nothing if the specified theme is
already loaded, otherwise re-apply the theme and siren-overrides."
    (interactive (list (completing-read "Choose theme: "
                                        (siren-doom-themes-list))))

    (if (string= (type-of theme) "string")
        (setq theme (intern theme)))
    (if (not (string-prefix-p "doom-" (symbol-name theme)))
        (error "'%s is not a doom-themes theme" theme))

    (when (or (not no-reapply)
              (not (member theme custom-enabled-themes)))
      ;; disable all themes
      (dolist (theme custom-enabled-themes)
        (when (not (string= theme "use-package"))
          (disable-theme theme)))

      ;; load doom theme
      (load-theme theme t)

      ;; load overrides theme: ../../themes/siren-doom-themes-overrides-theme.el
      (load-theme 'siren-doom-themes-overrides t)

      ;; execute custom function after loading/switching theme
      (with-eval-after-load 'highlight-indent-guides
        (highlight-indent-guides-auto-set-faces))))

  (defun siren-doom-themes-vibrant-theme ()
    (interactive)
    (siren-doom-themes-load 'doom-vibrant))
  (defalias 'doom-vibrant 'siren-doom-themes-vibrant-theme)

  (defun siren-doom-themes-nord-light-theme ()
    (interactive)
    (siren-doom-themes-load 'doom-nord-light))
  (defalias 'nord-light 'siren-doom-themes-nord-light-theme)

  (defun siren-doom-themes-list ()
    (seq-filter
     (lambda (n) (string-prefix-p "doom-" (symbol-name n)))
     (custom-available-themes))))

(provide 'siren-doom-themes)
;;; siren-doom-themes.el ends here
