;;; siren-desktop.el --- jimeh's Emacs Siren: desktop configuration.

;;; Commentary:

;; Basic configuration for desktop.

;;; Code:

(require 'siren-workspace-map)

(use-package desktop
  :straight (:type built-in)

  :hook
  (desktop-after-read . siren-desktop-after-read-hook)

  :custom
  (desktop-auto-save-timeout 10)
  (desktop-path (list siren-dir))
  (desktop-restore-forces-onscreen nil)
  (desktop-save 'ask-if-new)
  (desktop-restore-frames t)

  :config
  (siren-desktop-setup)

  (add-to-list 'desktop-clear-preserve-buffers "\\*straight-process\\*")
  (add-to-list 'desktop-clear-preserve-buffers "\\*explain-pause-top\\*")
  (add-to-list 'desktop-clear-preserve-buffers "\\*Async-native-compile-log\\*")
  (push '(alpha . :never) frameset-filter-alist)
  (push '(background-color . :never) frameset-filter-alist)
  (push '(background-mode . :never) frameset-filter-alist)
  (push '(border-width . :never) frameset-filter-alist)
  (push '(bottom-divider-width . :never) frameset-filter-alist)
  (push '(cursor-color . :never) frameset-filter-alist)
  (push '(cursor-type . :never) frameset-filter-alist)
  (push '(display-type . :never) frameset-filter-alist)
  (push '(environment . :never) frameset-filter-alist)
  (push '(font . :never) frameset-filter-alist)
  (push '(fontsize . :never) frameset-filter-alist)
  (push '(foreground-color . :never) frameset-filter-alist)
  (push '(fullscreen . :never) frameset-filter-alist)
  (push '(fullscreen-restore . :never) frameset-filter-alist)
  (push '(horizontal-scroll-bars . :never) frameset-filter-alist)
  (push '(internal-border-width . :never) frameset-filter-alist)
  (push '(left-fringe . :never) frameset-filter-alist)
  (push '(line-spacing . :never) frameset-filter-alist)
  (push '(menu-bar-lines . :never) frameset-filter-alist)
  (push '(ns-appearance . :never) frameset-filter-alist)
  (push '(ns-transparent-titlebar . :never) frameset-filter-alist)
  (push '(powerline-cache . :never) frameset-filter-alist)
  (push '(right-divider-width . :never) frameset-filter-alist)
  (push '(right-fringe . :never) frameset-filter-alist)
  (push '(scroll-bar-height . :never) frameset-filter-alist)
  (push '(scroll-bar-width . :never) frameset-filter-alist)
  (push '(tab-bar-lines . :never) frameset-filter-alist)
  (push '(tool-bar-lines . :never) frameset-filter-alist)
  (push '(tool-bar-position . :never) frameset-filter-alist)
  (push '(vertical-scroll-bars . :never) frameset-filter-alist)

  :init
  (defun siren-desktop-setup ())

  ;; Enable restoring window configurations when running in terminal
  ;;  - from: https://emacs.stackexchange.com/a/45829
  (defun siren-desktop-after-read-hook ()
    (frameset-restore
     desktop-saved-frameset
     :reuse-frames (eq desktop-restore-reuses-frames t)
     :cleanup-frames (not (eq desktop-restore-reuses-frames 'keep))
     :force-display desktop-restore-in-current-display
     :force-onscreen desktop-restore-forces-onscreen)))

(use-package desktop+
  :bind
  (:map siren-workspace-map
        ("C-z c" . desktop+-create)
        ("C-z C-c" . desktop+-create)
        ("C-z n" . siren-desktop+-create-new)
        ("C-z C-n" . siren-desktop+-create-new)
        ("C-z s" . desktop+-load-or-create)
        ("C-z C-s" . desktop+-load-or-create)
        ("C-z l" . desktop+-load)
        ("C-z C-l" . desktop+-load))

  :config
  (siren-desktop+-setup)

  :init
  (defvar siren-desktop+-base-dir (expand-file-name "desktops" siren-dir))

  (defun siren-desktop+-setup ()
    (unless (file-exists-p siren-desktop+-base-dir)
      (make-directory siren-desktop+-base-dir)))

  (defun siren-desktop+-current-desktop ()
    (when (and (boundp 'desktop-dirname) desktop-dirname)
      (let ((dir (directory-file-name desktop-dirname))
              (base-dir (expand-file-name siren-desktop+-base-dir)))
          (when (string-prefix-p base-dir dir)
            (file-name-nondirectory dir)))))

  (defun siren-desktop+-list ()
    "Return a list of available desktops"
    (remove "." (remove ".." (directory-files siren-desktop+-base-dir))))

  (defun siren-desktop+-list-interactive ()
    (let ((current (siren-desktop+-current-desktop))
          (desktops (siren-desktop+-list)))
      (if current
          (append (list current)
                  (delete current desktops))
        desktops)))

  (defun desktop+-load-or-create (name)
    "Load or create a desktop session by name."
    (interactive
     (list
      (completing-read "Desktop name: " (siren-desktop+-list-interactive))))
    (if (member name (siren-desktop+-list))
        (if (not (string= name (siren-desktop+-current-desktop)))
            (desktop+-load name))
      (desktop+-create name)))

  (defun siren-desktop+-create-new (name)
    "Create a new empty session, identified by a name.
The session is created in a subdirectory of `siren-desktop+-base-dir'.
It can afterwards be reloaded using `desktop+-load'.

As a special case, if NAME is left blank, the session is
automatically named after the current working directory."
    (interactive "MDesktop name: ")
    (desktop-kill)
    (desktop-clear)
    (setq desktop-dirname (desktop+--dirname name))
    (make-directory desktop-dirname 'parents)
    (desktop-save desktop-dirname)
    (desktop+--set-frame-title)
    (desktop-save-mode 1))
  )

(provide 'siren-desktop)
;;; siren-desktop.el ends here
