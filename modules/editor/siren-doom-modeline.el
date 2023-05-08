;;; siren-doom-modeline.el --- jimeh's Emacs Siren: doom-modeline theme.

;;; Commentary:

;; Setup for doom-modeline theme.

;;; Code:

(let ((straight-current-profile 'pinned))
  ;; Pin doom-modeline to before they switched to nerd-icons, and I'm having a
  ;; number of bugs how nerd icons are rendered.
  (straight-x-pin-package "doom-modeline"
                          "918730eff72e155cfb31b012493a7f425bc48ff8")

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
    (doom-modeline-persp-name nil)
    (doom-modeline-vcs-max-length 24)
    (doom-modeline-workspace-name nil)

    :config
    (doom-modeline-mode)))

(provide 'siren-doom-modeline)
;;; siren-doom-modeline.el ends here
