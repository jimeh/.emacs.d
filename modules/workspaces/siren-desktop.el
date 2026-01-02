;;; siren-desktop.el --- jimeh's Emacs Siren: desktop configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for desktop.

;;; Code:

(require 'siren-workspace-map)

(use-package desktop
  :ensure nil

  :general
  (:keymaps 'siren-workspace-map
            "C-z" 'siren-desktop-map)

  :hook
  (desktop-after-read . siren-desktop-after-read-hook)

  :custom
  (desktop-auto-save-timeout 10)
  (desktop-path (list siren-dir))
  (desktop-restore-forces-onscreen nil)
  (desktop-save 'ask-if-new)
  (desktop-restore-frames t)

  :config
  (add-to-list 'desktop-clear-preserve-buffers "\\*straight-process\\*")
  (add-to-list 'desktop-clear-preserve-buffers "\\*elpaca-log\\*")
  (add-to-list 'desktop-clear-preserve-buffers "\\*explain-pause-top\\*")
  (add-to-list 'desktop-clear-preserve-buffers "\\*Async-native-compile-log\\*")
  (add-to-list 'desktop-clear-preserve-buffers "\\*Native-compile-Log\\*")

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
  (push '(zoom-window-buffers . :never) frameset-filter-alist)
  (push '(zoom-window-enabled . :never) frameset-filter-alist)

  :preface
  (define-prefix-command 'siren-desktop-map)

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
  :general
  (:keymaps 'siren-desktop-map
            "c" 'desktop+-create
            "C-c" 'desktop+-create
            "n" 'siren-desktop+-create-new
            "C-n" 'siren-desktop+-create-new
            "s" 'desktop+-load-or-create
            "C-s" 'desktop+-load-or-create
            "l" 'desktop+-load
            "C-l" 'desktop+-load)

  :config
  (unless (file-exists-p desktop+-base-dir)
    (make-directory desktop+-base-dir))

  :preface
  (defvar desktop+-base-dir (siren-dir "desktops")
    "Base directory for desktop files.")

  (defun siren-desktop+-current-desktop ()
    (when (and (boundp 'desktop-dirname) desktop-dirname)
      (let ((dir (directory-file-name desktop-dirname))
              (base-dir (expand-file-name desktop+-base-dir)))
          (when (string-prefix-p base-dir dir)
            (file-name-nondirectory dir)))))

  (defun siren-desktop+-list ()
    "Return a list of available desktops"
    (remove nil (mapcar 'siren-desktop+--list-filter-item
                        (directory-files desktop+-base-dir t))))

  (defun siren-desktop+--list-filter-item (path)
    (let ((basename (file-name-nondirectory path))
          (is-dir (car (file-attributes path))))
      (if (and is-dir (not (member basename '("." ".."))))
          (file-name-nondirectory path))))

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
The session is created in a subdirectory of `desktop+-base-dir'.
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
