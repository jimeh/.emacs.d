;;; siren-beginend.el --- jimeh's Emacs Siren: beginend  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Configuration for beginend

;;; Code:

(use-package beginend
  :hook
  (compilation-mode . beginend-compilation-mode)
  (dired-mode . beginend-dired-mode)
  (ibuffer-mode . beginend-ibuffer-mode)
  (magit-revision-mode . beginend-magit-revision-mode)
  (magit-status-mode . beginend-magit-status-mode)
  (prog-mode . beginend-prog-mode))

(provide 'siren-beginend)
;;; siren-beginend.el ends re
