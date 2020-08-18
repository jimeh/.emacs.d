;;; siren-desktop.el --- jimeh's Emacs Siren: desktop configuration.

;;; Commentary:

;; Basic configuration for desktop.

;;; Code:

(require 'siren-workspace-map)

(use-package desktop
  :straight (:type built-in)

  :hook
  (emacs-startup . siren-desktop-setup)
  (desktop-after-read . siren-desktop-after-read-hook)

  :custom
  (desktop-auto-save-timeout 10)
  (desktop-path (list siren-dir))
  (desktop-restore-forces-onscreen nil)
  (desktop-save 'ask-if-new)
  (desktop-restore-frames t)

  :config
  (push '(font . :never) frameset-filter-alist)
  (push '(fontsize . :never) frameset-filter-alist)
  (push '(fullscreen . :never) frameset-filter-alist)
  (push '(fullscreen-restore . :never) frameset-filter-alist)
  (push '(alpha . :never) frameset-filter-alist)

  :init
  (defun siren-desktop-setup ()
    (if (not (daemonp))
        (desktop-save-mode 1)))

  ;; Enable restoring window configurations when running in terminal
  ;;  - from: https://emacs.stackexchange.com/a/45829[<8;233;28m]
  (defun siren-desktop-after-read-hook ()
    (frameset-restore
     desktop-saved-frameset
     :reuse-frames (eq desktop-restore-reuses-frames t)
     :cleanup-frames (not (eq desktop-restore-reuses-frames 'keep))
     :force-display desktop-restore-in-current-display
     :force-onscreen desktop-restore-forces-onscreen)))

(use-package desktop+
  :hook
  (emacs-startup . siren-desktop+-setup)

  :custom
  (desktop+-base-dir (expand-file-name "desktops" siren-dir))

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

  :init
  (defun siren-desktop+-setup ()
    (unless (file-exists-p desktop+-base-dir)
      (make-directory desktop+-base-dir))

    (if (not (daemonp))
        (desktop+-load-or-create "default")))

  (defun siren-desktop+-current-desktop ()
    (when (boundp 'desktop-dirname)
      (let ((dir (directory-file-name desktop-dirname))
              (base-dir (expand-file-name desktop+-base-dir)))
          (when (string-prefix-p base-dir dir)
            (file-name-nondirectory dir)))))

  (defun siren-desktop+-list ()
    "Return a list of available desktops"
    (remove "." (remove ".." (directory-files desktop+-base-dir))))

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
