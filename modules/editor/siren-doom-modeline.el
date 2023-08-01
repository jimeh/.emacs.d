;;; siren-doom-modeline.el --- jimeh's Emacs Siren: doom-modeline theme.

;;; Commentary:

;; Setup for doom-modeline theme.

;;; Code:

(use-package doom-modeline
  :custom
  (doom-modeline-bar-width 3)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-buffer-file-name-style 'auto)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-checker-simple-format t)
  (doom-modeline-enable-word-count t)
  (doom-modeline-height 25)
  (doom-modeline-indent-info nil)
  (doom-modeline-minor-modes t)
  (doom-modeline-hud t)
  (doom-modeline-persp-name nil)
  (doom-modeline-vcs-max-length 24)
  (doom-modeline-workspace-name nil)

  :preface
  (defgroup siren-doom-modeline nil
    "Siren specific tweaks to doom-modeline."
    :group 'doom-modeline)

  (defcustom siren-doom-modeline-override-icons '(("nf-md-check_circle_outline" . "nf-md-check_bold"))
    "List of icons to override with different icons."
    :type '(alist :key-type string :value-type string)
    :group 'siren-doom-modeline)

  (defun siren-doom-modeline-checker-icon-advice (orig-fun icon unicode text face)
    (let ((icon (or (cdr (assoc icon siren-doom-modeline-override-icons)) icon)))
      (apply orig-fun (list icon unicode text face))))

  :config
  (advice-add 'doom-modeline-checker-icon :around #'siren-doom-modeline-checker-icon-advice)

  (doom-modeline-mode))

(provide 'siren-doom-modeline)
;;; siren-doom-modeline.el ends here
