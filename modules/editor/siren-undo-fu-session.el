;;; siren-undo-fu-session.el --- jimeh's Emacs Siren: undo-fu-session configuration.

;;; Commentary:

;; Basic configuration for undo-fu-session.

;;; Code:

(use-package undo-fu-session
  :demand
  :custom
  (undo-fu-session-directory (siren-cache-dir "undo-fu-session"))
  (undo-fu-session-linear nil)
  (undo-fu-session-compression 'gz)
  (undo-fu-session-file-limit nil)
  (undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'"
                                        "/git-rebase-todo\\'"))

  :config
  (global-undo-fu-session-mode))

(provide 'siren-undo-fu-session)
;;; siren-undo-fu-session.el ends here
