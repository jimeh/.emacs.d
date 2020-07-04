;;; siren-core-performance.el --- jimeh's Emacs Siren: Performance tweaks

;;; Commentary:

;; Performance tweaks.

;;; Code:

;; Setup and use gcmh-mode for improved garbage collection.
(use-package gcmh
  :hook
  (emacs-startup . (lambda() (gcmh-mode +1)))
  (focus-out-hook . gcmh-idle-garbage-collect)

  :custom
  (gcmh-idle-delay 10)
  (gcmh-high-cons-threshold 104857600))

(provide 'siren-core-performance)
;;; siren-core-performance.el ends here
