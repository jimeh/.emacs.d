;;; siren-solaire-mode.el --- jimeh's Emacs Siren: solaire-mode.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for solaire-mode.

;;; Code:

(use-package solaire-mode
  :config
  ;; Prevent solaire-mode from overriding the modeline faces. The difference in
  ;; color between normal buffers and special is confusing and annoying.
  (dolist (face '(mode-line mode-line-active mode-line-inactive))
    (setf (alist-get face solaire-mode-remap-alist) nil))

  (solaire-global-mode +1))

(provide 'siren-solaire-mode)
;;; siren-solaire-mode.el ends here
