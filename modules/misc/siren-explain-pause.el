;;; siren-explain-pause.el --- jimeh's Emacs Siren: explain-pause-mode configuration.

;;; Commentary:

;; Basic configuration for explain-pause-mode.

;;; Code:

(use-package explain-pause-mode
  :straight (:type git :host github :repo "lastquestion/explain-pause-mode")

  :custom
  (explain-pause-blocking-too-long-ms 40))

(provide 'siren-explain-pause)
;;; siren-explain-pause.el ends here
