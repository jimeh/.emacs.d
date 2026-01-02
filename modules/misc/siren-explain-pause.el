;;; siren-explain-pause.el --- jimeh's Emacs Siren: explain-pause-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for explain-pause-mode.

;;; Code:

(use-package explain-pause-mode
  :ensure (:host github :repo "lastquestion/explain-pause-mode")
  :defer t

  :custom
  (explain-pause-blocking-too-long-ms 40))

(provide 'siren-explain-pause)
;;; siren-explain-pause.el ends here
