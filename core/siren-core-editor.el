;;; siren-core-editor.el --- jimeh's Emacs Siren: Editor settings.

;;; Commentary:

;; Default editor settings for Siren.

;;; Code:

;; don't use tabs to indent
(setq-default indent-tabs-mode nil)

;; but maintain correct appearance
(setq-default tab-width 8)

;; Newline at end of file
(setq require-final-newline t)

;; Visual Line mode - wrap lines
(visual-line-mode t)

;; Show matching parentheses
(show-paren-mode t)

;; Delete the selection with a keypress
(delete-selection-mode t)

;; Separate sentences with a single space instead of two.
(setq sentence-end-double-space nil)

;; Save place in files
(setq save-place-file (siren-cache-dir "saveplace"))
(save-place-mode 1)

;; Electric behavior
;; (electric-layout-mode t)

;; Cursor
(if window-system
  (progn
      (blink-cursor-mode t)
      (setq initial-frame-alist
            (cons '(cursor-type . bar) (copy-alist initial-frame-alist)))
      (setq default-frame-alist
            (cons '(cursor-type . bar) (copy-alist default-frame-alist))))
      (blink-cursor-mode -1))

;; Backup files
(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 10
      kept-old-versions 0
      vc-make-backup-files t
      version-control t
      backup-directory-alist `((".*" . ,(siren-cache-dir "backup"))))

;; Auto-save files
(let ((auto-save-dir (siren-cache-dir "autosave/")))
  (unless (file-exists-p auto-save-dir)
    (make-directory auto-save-dir))
  (setq auto-save-interval 20
        auto-save-file-name-transforms
        `((".*" ,auto-save-dir t))))

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)
(when (eq system-type 'darwin)
  ;; File notifications seem unreliable on macOS.
  (setq auto-revert-use-notify nil))

;; Enable mouse support when running in a console
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
  (siren-general-define-key
   "<mouse-4>" 'scroll-down-line
   "<mouse-5>" 'scroll-up-line))

;; enabled change region case commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; make a shell script executable automatically on save
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; saner regex syntax
(require 're-builder)
(setq reb-re-syntax 'string)

(provide 'siren-core-editor)
;;; siren-core-editor.el ends here
