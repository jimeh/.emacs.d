;;; siren-doom-modeline.el --- jimeh's Emacs Siren: doom-modeline theme.

;;; Commentary:

;; Setup for doom-modeline theme.

;;; Code:

(use-package doom-modeline
  :hook (emacs-startup . doom-modeline-mode)

  :custom
  (doom-modeline-bar-width 3)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-checker-simple-format t)
  (doom-modeline-enable-word-count t)
  (doom-modeline-height 25)
  (doom-modeline-indent-info nil)
  (doom-modeline-minor-modes t)
  (doom-modeline-persp-name nil)
  (doom-modeline-vcs-max-length 24)
  (doom-modeline-workspace-name nil))

(provide 'siren-doom-modeline)
;;; siren-doom-modeline.el ends here
